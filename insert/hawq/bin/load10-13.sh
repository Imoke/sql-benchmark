#!/bin/bash
set -x

##psql -U lw -d testhawq -f /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D1_P4/createtable.sql
##psql -U lw -d testhawq -f /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D1_P4/create_ext_table.sql

function run(){
	local url=$1
	echo "$url start!!"
	psql -U lw -d testhawq -f $1
	echo "$url end"
}

##run /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D1_P4/insertdata_1.sql &
##run /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D1_P4/insertdata_2.sql &
##run /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D1_P4/insertdata_3.sql &
##run /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D1_P4/insertdata_4.sql &
##wait
##echo "finish L10-13/D1_P4"

##psql -U lw -d testhawq -f /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D1000w_P4/createtable.sql
#psql -U lw -d testhawq -f /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D1000w_P4/create_ext_table.sql
#run /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D1000w_P4/insertdata_1.sql &
#run /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D1000w_P4/insertdata_2.sql &
#run /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D1000w_P4/insertdata_3.sql &
#run /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D1000w_P4/insertdata_4.sql &
#wait
#echo "finish L10-13/D1000w_P4"

psql -U lw -d testhawq -f /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D10_P10/createtable.sql
psql -U lw -d testhawq -f /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D10_P10/create_ext_table.sql
run /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D10_P10/insertdata_1.sql &
run /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D10_P10/insertdata_2.sql &
run /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D10_P10/insertdata_3.sql &
run /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D10_P10/insertdata_4.sql &
wait
echo "finish L10-13/D10_P10"


#psql -U lw -d testhawq -f /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D30_P10/createtable.sql
#psql -U lw -d testhawq -f /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D30_P10/create_ext_table.sql
#run /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D30_P10/insertdata_1.sql &
#run /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D30_P10/insertdata_2.sql &
#run /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D30_P10/insertdata_3.sql &
#run /home/lw/hawqtest/hawq_insert_test/sql/L10-13/D30_P10/insertdata_4.sql &
#wait
#echo "finish L10-13/D30_P10"

