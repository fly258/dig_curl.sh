#!/usr/bin/env bash
# Create Date: 2019-09-3o
# Author:      fly
# Mail:       fly@258.com
# Version:     2.0
# Explain:   write for dig url
bash=$(cd "$(dirname "$0")"; pwd)
cd `echo ${bash}`
source /etc/profile


dns=211.140.13.188  ##配置解析的DNS
cur_time=`date +%Y%m%d%H%M` ##日记输出时间

while read URL  

do
	echo "$URL" >> dig_result_$cur_time.log
	dig @$dns +short "$URL" > aa  ##dig输出内容可以根据自己情况修改
	cat aa |grep -v ^[a-z] >> dig_result_$cur_time.log
	echo "" >> dig_result_$cur_time.log
done < url ##需要解析的域名每行一条在脚本目录里面的url文件里

sleep  5

awk '{if($0 !~ /^$/)printf "%s ",$0;else print}' dig_result_$cur_time.log >> dig_end_"$cur_time".txt ## log输出结果
