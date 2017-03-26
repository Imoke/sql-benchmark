#!/bin/sh
set -x
ROOT=$(cd `dirname $0`/.. && pwd)
ROUND=$1

if [ "x$ROUND" == "x" ]
then
	echo "Usage: $0 <RoundID>"
	exit 1
fi

if [ ! -d "$ROOT/conf/$ROUND" ]
then
	echo "Unknown RoundID: $ROUND"
	exit 2
fi 

ROOT_CONF="$ROOT/conf/$ROUND"

SSH="ssh -o StrictHostKeyChecking=no"
SCP="scp -o StrictHostKeyChecking=no"
ME_WKDIR=/tmp/istest-$ROUND
RES_DIR=$ROOT/result/$ROUND

function LOG() {
	echo "[`date +"%Y-%m-%d %H:%M:%S"`] $1"
}

function MultStart() {
	TH_FILE=$1
	SCRIPT=$2	
	PIDS=
	for IP in `cat $TH_FILE | awk '{print $1}'`
	do
		ME=root@$IP
		$SSH $ME sh -l $SCRIPT $IP &
		PID=$!
		PIDS="$PIDS $PID"
		LOG "$ME:$SCRIPT started, pid=$PID, threads=`grep $IP $TH_FILE | awk '{print $2":"$3}'`"
	done
	for PID in $PIDS
	do
		wait $PID
	done
}

function Analyze() {
	DATA_FILE=$1
	REPORT_FILE=$2
	TITLE=$3
	LINE_TOTAL=$(wc -l $DATA_FILE | awk '{print $1}')
	echo "${TITLE}AVG: $((`cat $DATA_FILE | awk '{sum += $1} END {print sum}'` / $LINE_TOTAL))" >> $REPORT_FILE
	echo "${TITLE}MIN: `head -n 1 $DATA_FILE`" >> $REPORT_FILE
	echo "${TITLE}TP20: `head -n $(($LINE_TOTAL / 5)) $DATA_FILE | tail -n 1`" >> $REPORT_FILE
	echo "${TITLE}TP50: `head -n $(($LINE_TOTAL / 2)) $DATA_FILE | tail -n 1`" >> $REPORT_FILE
	echo "${TITLE}TP80: `tail -n $(($LINE_TOTAL / 5 + 1)) $DATA_FILE | head -n 1`" >> $REPORT_FILE
	echo "${TITLE}TP90: `tail -n $(($LINE_TOTAL / 10 + 1)) $DATA_FILE | head -n 1`" >> $REPORT_FILE
	echo "${TITLE}TP95: `tail -n $(($LINE_TOTAL / 20 + 1)) $DATA_FILE | head -n 1`" >> $REPORT_FILE
	echo "${TITLE}MAX: `tail -n 1 $DATA_FILE `" >> $REPORT_FILE
}

function WatchStart() {
	for IP in `cat $ROOT/conf/nodes`
	do
		ME=root@$IP
		$SSH $ME sh -l $ME_WKDIR/watch-start.sh 1
		LOG "$IP watch started"
	done
}

function WatchStop() {
	for IP in `cat $ROOT/conf/nodes`
	do
		ME=root@$IP
		$SSH $ME sh -l $ME_WKDIR/watch-stop.sh
		LOG "$IP watch stopped"
	done
}

function WatchLogSave() {
	SAVE_DIR=$1
	for IP in `cat $ROOT/conf/nodes`
	do
		ME=root@$IP
		for ITEM in cpu disk memory net
		do
			LOG "$SCP $ME:$ME_WKDIR/$ITEM.log $SAVE_DIR/$IP-$ITEM.log"
			$SCP $ME:$ME_WKDIR/$ITEM.log $SAVE_DIR/$IP-$ITEM.log
		done
	done
}

################################################################################
LOG "=== Round [$ROUND] Start ==="
################################################################################

################################################################################
LOG "--- Prepare Start ---"
################################################################################

rm -rf $RES_DIR && mkdir -p $RES_DIR/insert/machine && mkdir -p $RES_DIR/select

for IP in `cat $ROOT_CONF/*.threads $ROOT/conf/nodes | awk '{print $1}' | sort | uniq`
do
	ME=root@$IP

	LOG "preparing $ME:$ME_WKDIR"

	$SSH $ME rm -rf $ME_WKDIR
	$SSH $ME mkdir -p $ME_WKDIR
	$SCP $ROOT/scripts/* $ROOT/libs/* $ROOT/conf/*.properties $ME:$ME_WKDIR
	$SCP $ROOT_CONF/* $ME:$ME_WKDIR
done

################################################################################
#LOG "--- Run Insert Test ---"
#################################################################################
#
#WatchStart 
#
#TS_INS_START=`date +%s`
#LOG "Insert Test Start" > $RES_DIR/insert/time-total.log
#
#MultStart $ROOT_CONF/insert.threads $ME_WKDIR/insert-test.sh
#
#TS_INS_END=`date +%s`
#LOG "Insert Test End" >> $RES_DIR/insert/time-total.log
#LOG "Totally cost: $(($TS_INS_END-$TS_INS_START)) seconds" >> $RES_DIR/insert/time-total.log
#
#WatchStop
#
#################################################################################
#LOG "--- Save And Analize Insert Log ---"
#################################################################################
#
#for IP in `cat $ROOT_CONF/insert.threads | awk '{print $1}'`
#do
#	ME=root@$IP
#	$SSH $ME cat $ME_WKDIR/insert-time-every.log >> $RES_DIR/insert/time-every.log
#done
#
#cat $RES_DIR/insert/time-every.log | awk -F '\|' '{print $3}' | awk -F CT '{print $2}' | sort -n > $RES_DIR/insert/.time-every.ct.log
#Analyze $RES_DIR/insert/.time-every.ct.log $RES_DIR/insert/time-every-analysis.log
#
#WatchLogSave $RES_DIR/insert/machine
#
################################################################################
LOG "--- Run Select Test ---"
################################################################################

TS_INS_START=`date +%s`
LOG "Select Test Start" > $RES_DIR/select/time-total.log

MultStart $ROOT_CONF/select.threads $ME_WKDIR/select-test.sh

TS_INS_END=`date +%s`
LOG "Select Test End" >> $RES_DIR/select/time-total.log
LOG "Totally cost: $(($TS_INS_END-$TS_INS_START)) seconds" >> $RES_DIR/select/time-total.log

################################################################################
LOG "--- Save And Analize Select Log ---"
################################################################################

for IP in `cat $ROOT_CONF/select.threads | awk '{print $1}'`
do
	ME=root@$IP
	$SSH $ME cat $ME_WKDIR/select-time-detail.log >> $RES_DIR/select/time-detail.log
done

grep "TT" $RES_DIR/select/time-detail.log | awk -F 'TT' '{print $2}' | sort -n > $RES_DIR/select/.time-detail.tt.log
Analyze $RES_DIR/select/.time-detail.tt.log $RES_DIR/select/time-total-analysis.log

QY_SET=`cat $RES_DIR/select/time-detail.log | awk -F '\|' '{print $3}' | sort | uniq | awk -F QY '{print $2}'`
for QY in $QY_SET
do
	grep "QY$QY" $RES_DIR/select/time-detail.log | awk -F 'CT' '{print $2}' | sort -n > $RES_DIR/select/.time-detail.$QY.log
	Analyze $RES_DIR/select/.time-detail.$QY.log $RES_DIR/select/time-detail-analysis.log "$QY "
	echo "-----" >> $RES_DIR/select/time-detail-analysis.log
done

################################################################################
LOG "=== Round [$ROUND] End ==="
################################################################################

#rm -rf $RES_DIR/insert/.*.log
#rm -rf $RES_DIR/select/.*.log
