#!/bin/bash

TRAFF_TOTAL=800 #改成自己的预定额度，建议稍小些，单位GB;
TRAFF_DAY_TOTAL=5 #改成自己的预定额度，建议稍小些，单位GB;

TRAFF_USED=$(vnstat --oneline b | awk -F';' '{print $11}')
MONTH_GB=$(expr $TRAFF_USED / 1073741824)

TRAFF_DAY_USED=$(vnstat --oneline b | awk -F';' '{print $6}')
DAY_GB=$(expr $TRAFF_DAY_USED / 1073741824)

if [ $MONTH_GB -ge $TRAFF_TOTAL ]; then
    shutdown -h now
fi

if [ $DAY_GB -ge $TRAFF_DAY_TOTAL ]; then
    shutdown -h now
fi
