#!/usr/bin/env bash
# Create Date: 2018-09-29
# Author:      fly
# Mail:       fly@258.com
# Version:     1.0
# Explain:   write for nping test
bash=$(cd "$(dirname "$0")"; pwd)
cd `echo ${bash}`
source /etc/profile


dns=211.140.13.188
cur_time=`date +%Y%m%d%H%M`

while read URL

do
	echo "$URL" >> dig_result_$cur_time.log
	dig @$dns +short "$URL" > aa
	cat aa |grep -v ^[a-z] >> dig_result_$cur_time.log
	echo "" >> dig_result_$cur_time.log
done < url

sleep  5

awk '{if($0 !~ /^$/)printf "%s ",$0;else print}' dig_result_$cur_time.log >> dig_end_"$cur_time".txt
