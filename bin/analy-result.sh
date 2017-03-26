#!/bin/bash

set -x

analy_file=$1;
if [ "x$analy_file" == "x" ]
then 
	echo "Usage $0 <analy_file_file>"
        exit 1
fi

out_all_file=/root/lw/hawq-test-tool/analy-result-data-all
out_special_file=/root/lw/hawq-test-tool/analy-result-data-special

var1=(2 3 4)
var2=(1 2 3 4 5 6 7)
var3=(2 3 4)

function ergodic(){
  for file in `ls $1`
  do
    if [ -d $1"/"$file ]
    then
      ergodic $1"/"$file
    else
      local path=$1"/"$file 
	local name=$file      
      echo $name $path 
    fi
  done
}

IFS=$'\n' #这个必须要，否则会在文件名中有空格时出错
ergodic $analy_file > $out_all_file
##获取要分析的文件的路径
path=$(gawk 'BEGIN{FS=" "} $1 ~/^time-detail-analysis.log/{printf "%s:", $2 }' $out_all_file)
echo $path > $out_all_file
path_num=`echo $path | tr -cd ":" | wc -c`
echo $path_num
num=1


## 获取所有的文件的数据，并以md形式表示出来
function get_all_data(){
	echo $1 >> $out_file
	echo "|command|AVG|MIN|TP20|TP50|TP80|TP90|TP95|MAX| " >> $out_all_file
	echo "|:----|:----|:----|:----|:----|:----|:----|:----|" >> $out_all_file
	for((i=0; i<7; i++)){
		for((j=0; j<3; j++)){
			title=$(gawk 'BEGIN{FS=" "} $1 ~/^1-'${var2[i]}'-'${var3[j]}'/{printf "%d|", $3}' $1)
			echo "|"1-${var2[i]}-${var3[j]}"|"$title >> $out_all_file
       	 	}
	}


	for((i=0; i<3; i++)){
        	for((j=0; j<7; j++)){
                	title=$(gawk 'BEGIN{FS=" "} $1 ~/^'${var1[i]}'-'${var2[j]}'-1/{printf "%d|", $3}' $1)
	                echo "|"${var1[i]}-${var2[j]}-1"|"$title >> $out_all_file
        	}
	}
}
## 获取特殊数据，比如TP90
function get_special_data(){
        var1=(2 3 4)
        var2=(1 2 3 4 5 6 7)
        var3=(2 3 4)
        for((i=0; i<7; i++)){
                for((j=0; j<3; j++)){
                        title=$(gawk 'BEGIN{FS=" "} $1 ~/^1-'${var2[i]}'-'${var3[j]}'/' $1 | gawk 'BEGIN{FS=" "} $2 ~/^TP90/{printf "%d|",$3}')
			#title=$(echo $title)
                        line_num=$[ 3 * i + j + 3 ] 
			sed -i "${line_num} s/$/$title/g" $out_special_file
                }
        }


        for((i=0; i<3; i++)){
                for((j=0; j<7; j++)){
                        title=$(gawk 'BEGIN{FS=" "} $1 ~/^'${var1[i]}'-'${var2[j]}'-1/' $1 | gawk 'BEGIN{FS=" "} $2 ~/^TP90/{printf "%d|",$3}')
			#title=$(echo $title)
               		line_num=$[ 7 * i + j + 24 ]
			sed -i "${line_num} s/$/$title/g" $out_special_file
		 }
        }

}


function show_all_data(){
while [ $num -le $path_num ]
do
        #echo $path | cut -d : -f $num >> $out_file
        the_path=`echo $path | cut -d : -f $num`
        get_all_data $the_path
        let num=num+1
done
}
function show_special_data(){
	echo "|command|L1|L2|L3|L4|L5| " > $out_special_file
        echo "|:----|:----|:----|:----|:----|:----|" >> $out_special_file
	 for((i=0; i<7; i++)){
                for((j=0; j<3; j++)){
                        echo "|"1-${var2[i]}-${var3[j]}"|" >> $out_special_file
                }
        }


        for((i=0; i<3; i++)){
                for((j=0; j<7; j++)){
                        echo "|"${var1[i]}-${var2[j]}-1"|" >> $out_special_file
                }
        }

	while [ $num -le $path_num ]
		do
       		#echo $path | cut -d : -f $num >> $out_file
	        the_path=`echo $path | cut -d : -f $num`
       	 	get_special_data $the_path
       	 	let num=num+1
	done

}
#show_all_data
show_special_data

#show_all_data
