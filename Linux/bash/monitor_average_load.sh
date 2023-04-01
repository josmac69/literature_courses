#!/bin/bash

## here you can set num of seconds between checks
SLEEPSEC=5
##

unset arr1min
unset arr5min
unset arr15min
CYCLES=0
MAX1MIN=0
MAX5MIN=0
MAX15MIN=0
CPUNUM=$(grep processor /proc/cpuinfo|wc -l)
MIN5MIN=$CPUNUM
MIN1MIN=$CPUNUM
MIN15MIN=$CPUNUM

while true
do
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    CYCLES=$(( $CYCLES+1 ))
    LOAD1MIN=$(cat /proc/loadavg|cut -d' ' -f1)
    LOAD5MIN=$(cat /proc/loadavg|cut -d' ' -f2)
    LOAD15MIN=$(cat /proc/loadavg|cut -d' ' -f3)

    arr1min[$CYCLES]=$LOAD1MIN
    arr5min[$CYCLES]=$LOAD5MIN
    arr15min[$CYCLES]=$LOAD15MIN

    SUM1MIN=0
    SUM5MIN=0
    SUM15MIN=0
    for ((i=1;i<CYCLES;i++))
    do
        SUM1MIN=$(echo "$SUM1MIN+${arr1min[$i]}"|bc )
        SUM5MIN=$(echo "$SUM5MIN+${arr5min[$i]}"|bc )
        SUM15MIN=$(echo "$SUM15MIN+${arr15min[$i]}"|bc )
    done
    AVG1MIN=$(echo "scale=4; $SUM1MIN/$CYCLES"|bc )
    AVG5MIN=$(echo "scale=4; $SUM5MIN/$CYCLES"|bc )
    AVG15MIN=$(echo "scale=4; $SUM15MIN/$CYCLES"|bc ) ## 1 min
    if [ $( echo "$LOAD1MIN > $MAX1MIN"|bc ) -eq 1 ]
    then
        MAX1MIN=$LOAD1MIN
        MAX1MINTIME=$TIMESTAMP
    fi

    if [ $( echo "$LOAD1MIN < $MIN1MIN"|bc ) -eq 1 ]
    then
        MIN1MIN=$LOAD1MIN
        MIN1MINTIME=$TIMESTAMP
    fi ## 5 min
    if [ $( echo "$LOAD5MIN > $MAX5MIN"|bc ) -eq 1 ]
    then
        MAX5MIN=$LOAD5MIN
        MAX5MINTIME=$TIMESTAMP
    fi

    if [ $( echo "$LOAD5MIN < $MIN5MIN"|bc ) -eq 1 ]
    then
        MIN5MIN=$LOAD5MIN
        MIN5MINTIME=$TIMESTAMP
    fi ## 15 min
    if [ $( echo "$LOAD15MIN > $MAX15MIN"|bc ) -eq 1 ]
    then
        MAX15MIN=$LOAD15MIN
        MAX15MINTIME=$TIMESTAMP
    fi

    if [ $( echo "$LOAD15MIN < $MIN15MIN"|bc ) -eq 1 ]
    then
        MIN15MIN=$LOAD15MIN
        MIN15MINTIME=$TIMESTAMP
    fi

    echo ""
    echo "******* ${TIMESTAMP} (${CYCLES})*******"
    echo " 1 min: ${LOAD1MIN} / ${CPUNUM} - max: ${MAX1MIN} (${MAX1MINTIME}) min: ${MIN1MIN} (${MIN1MINTIME}) avg: ${AVG1MIN}"
    echo " 5 min: ${LOAD5MIN} / ${CPUNUM} - max: ${MAX5MIN} (${MAX5MINTIME}) min: ${MIN5MIN} (${MIN5MINTIME}) avg: ${AVG5MIN}"
    echo "15 min: ${LOAD15MIN} / ${CPUNUM} - max: ${MAX15MIN} (${MAX15MINTIME}) min: ${MIN15MIN} (${MIN15MINTIME}) avg: ${AVG15MIN}"
    sleep $SLEEPSEC
done
