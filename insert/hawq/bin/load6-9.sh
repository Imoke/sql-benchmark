#!/bin/bash
set -x


psql -U lw -d testhawq -f /home/lw/hawqtest/hawq_insert_test/sql/L6-9/D1/createtable.sql
psql -U lw -d testhawq -f /home/lw/hawqtest/hawq_insert_test/sql/L6-9/D1/create_ext_table.sql

function run(){
	local url=$1
	echo "$url start!!"
	psql -U lw -d testhawq -f $1
	echo "$url end"
}

run /home/lw/hawqtest/sql/hawq_insert_test/L6-9/D1/insertdata_1.sql &
run /home/lw/hawqtest/sql/hawq_insert_test/L6-9/D1/insertdata_2.sql &
run /home/lw/hawqtest/sql/hawq_insert_test/L6-9/D1/insertdata_3.sql &
run /home/lw/hawqtest/sql/hawq_insert_test/L6-9/D1/insertdata_4.sql &
wait
echo "finish L6-9/D1"

psql -U lw -d testhawq -f /home/lw/hawqtest/hawq_insert_test/sql/L6-9/D1000w/createtable.sql
psql -U lw -d testhawq -f /home/lw/hawqtest/hawq_insert_test/sql/L6-9/D1000w/create_ext_table.sql
run /home/lw/hawqtest/hawq_insert_test/sql/L6-9/D1000w/insertdata_1.sql &
run /home/lw/hawqtest/hawq_insert_test/sql/L6-9/D1000w/insertdata_2.sql &
run /home/lw/hawqtest/hawq_insert_test/sql/L6-9/D1000w/insertdata_3.sql &
run /home/lw/hawqtest/hawq_insert_test/sql/L6-9/D1000w/insertdata_4.sql &
wait
echo "finish L6-9/D1000w"

psql -U lw -d testhawq -f /home/lw/hawqtest/hawq_insert_test/sql/L6-9/D10/createtable.sql
psql -U lw -d testhawq -f /home/lw/hawqtest/hawq_insert_test/sql/L6-9/D10/create_ext_table.sql
run /home/lw/hawqtest/hawq_insert_test/sql/L6-9/D10/insertdata_1.sql &
run /home/lw/hawqtest/hawq_insert_test/sql/L6-9/D10/insertdata_2.sql &
run /home/lw/hawqtest/hawq_insert_test/sql/L6-9/D10/insertdata_3.sql &
run /home/lw/hawqtest/hawq_insert_test/sql/L6-9/D10/insertdata_4.sql &
wait
echo "finish L6-9/D10"


psql -U lw -d testhawq -f /home/lw/hawqtest/hawq_insert_test/sql/L6-9/D30/createtable.sql
psql -U lw -d testhawq -f /home/lw/hawqtest/hawq_insert_test/sql/L6-9/D30/create_ext_table.sql
run /home/lw/hawqtest/hawq_insert_test/sql/L6-9/D30/insertdata_1.sql &
run /home/lw/hawqtest/hawq_insert_test/sql/L6-9/D30/insertdata_2.sql &
run /home/lw/hawqtest/hawq_insert_test/sql/L6-9/D30/insertdata_3.sql &
run /home/lw/hawqtest/hawq_insert_test/sql/L6-9/D30/insertdata_4.sql &
wait
echo "finish L6-9/D30"




