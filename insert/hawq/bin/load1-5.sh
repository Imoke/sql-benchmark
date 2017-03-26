#!/bin/bash
set -x

psql -U lw -d postgres -f /home/lw/hawqtest/bin/create_database.sql
psql -U lw -d testhawq -f /home/lw/hawqtest/bin/createtable.sql

## psql -U lw -d testhawq -f /home/lw/hawqtest/bin/create_index.sql

psql -U lw -d testhawq -f /home/lw/hawqtest/bin/create_ext_table.sql

psql -U lw -d testhawq -f /home/lw/hawqtest/bin/insertdata.sql


