
# 1.加载测试步骤
 - a.生成测试数据：
` java -cp hawqTest.jar com.iecas.test.genedata.GenerateData 0 10 0 1000000 1000 
/data/volume_l/hawq/w250w_1.txt /data/volume_l/hawq/w250w_2.txt 
/data/volume_l/hawq/w250w_3.txt /data/volume_l/hawq/w250w_4.txt`
`0 10 0 1000000 100`分别代表线程开始，线程数，数据开始数目，数据总数，显示频率。`/data/volume_l/hawq/w250w_1.txt`数据生成的路径
 - b.开启监听端口：
`source greenplum_path.sh`加载环境变量
`mkdir -p /home/lw/log/gpfdistlog`
`gpfdist -p 8081 -d /data/volume_l/hawq/ -l /home/lw/log/gpfdistlog &`注意路径的创建和访问权限
 - c.执行`hawq_insert_test/bin `路径下 `start.sh`,进行加载数据到内部表（注意对SQL文件的修改，加载本地数据的路径）
 
# 2.查询测试步骤
 - a.执行查询测试命令：`bin/hawqtest_query.sh ROUND` ,ROUND 在conf 路径下,配置的是查询测试的轮数，这个轮数在conf下有实例。关于轮数下具体的描述参照
`hawq_query_test/README.md`。
 - b.执行完查询后，结果数据在result目录下，执行查询结果分析命令： `bin/analy-result.sh ./result` 。在这个脚本中需要更改分析结果输出的路径根据自己的实际情况。
`out_all_file=/root/lw/hawq-test-tool/analy-result-data-all`,`out_special_file=/root/lw/hawq-test-tool/analy-result-data-special`.j脚本后面两个最终结果的函数，
每次执行一个，注释另一个。`show_all_data`,`show_special_data`，前一个分析出所有的结果输出makedown表格。后一个输出特殊需求，比如TP90的makedown格式到指定文件。
 
