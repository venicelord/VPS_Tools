#!/usr/bin/bash
#使用which bash 检查bash的路径，旧版本可能是!/bin/bash


TRAFF_TOTAL=760 #改成自己的预定额度，建议稍小些，单位GB;

TRAFF_DAY_TOTAL=15 #改成自己的预定额度，建议稍小些，单位GB;


TRAFF_USED=$(vnstat --oneline b | awk -F';' '{print $11}')
MONTH_GB=$(expr $TRAFF_USED / 1073741824)


TRAFF_DAY_USED=$(vnstat --oneline b | awk -F';' '{print $6}')
DAY_GB=$(expr $TRAFF_DAY_USED / 1073741824)

if [ $MONTH_GB -gt $TRAFF_TOTAL ]; then
    shutdown -h now
fi

if [ $DAY_GB -gt $TRAFF_DAY_TOTAL ]; then
    shutdown -h now
fi
