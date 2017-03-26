#!/usr/bin/env bash
FILE_ROOT=`pwd`
ROOT=$(dirname $FILE_ROOT)
DATA_PATH=$1
SCP="scp -o StrictHostKeyChecking=no"
SSH="ssh -o StrictHostKeyChecking=no"
echo $ROOT
if [ "x$1" == "x" ]
then
        echo "please use a parama ,that is generate data path,make sure HAWQ user have auth of write and read"
        exit 1
fi

function geneatedata(){
         for HOST in `cat $ROOT/conf/node | awk '{print $1}'`
                do
                        $SSH $HOST mkdir -p $DATA_PATH
                        $SSH $HOST chmod 777 $DATA_PATH
        done

        java -cp $ROOT/libs/hawqTest.jar com.iecas.test.genedata.GenerateData 0 10 0 1000000000 1000000 $DATA_PATH/w25000w_1.txt $DATA_PATH/w25000w_2.txt $DATA_PATH/w25000w_3.txt $DATA_PATH/w25000w_4.txt
}

function senddata(){
        for HOST in `cat $ROOT/conf/node | awk '{print $1}'`
                do
                        $SCP $DATA_PATH/w25000w_*.txt $HOST:$DATA_PATH
        done

function startservice(){
        for HOST in `cat $ROOT/conf/node | awk '{print $1}'`

                do
                        $SSH $HOST touch /var/log/gpfdistlog
                        $SSH $HOST gpfdist -p 8081 -d $DATA_PATH -l /var/log/gpfdistlog &
        done
}

geneatedata
senddata
startservice
