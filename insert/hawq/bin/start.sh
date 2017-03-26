#!/bin/bash
set -x
psql -U lw -d postgres -f /home/lw/hawqtest/hawq_insert_test/sql/create_database.sql
psql -U lw -d testhawq -f /home/lw/hawqtest/hawq_insert_test/sql/create_result.sql
##sh load1-5.sh
##wait
##sh /home/lw/hawqtest/hawq_insert_test/bin/load6-9.sh
wait
sh /home/lw/hawqtest/hawq_insert_test/bin/load10-13.sh
