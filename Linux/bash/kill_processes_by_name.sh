#!/usr/bin/env bash

process_name=$1

echo_log () {
  echo "$(date +"%Y-%m-%d %H:%M:%S.%N"): $1"
}

echo_log "==========================================="
echo_log "Killing processes ${process_name}"
my_process=$(echo $$|tr -d ' ')
parent_process=$(ps -o ppid= -p ${my_process}|tr -d ' ')
echo_log "my process: ${my_process}, parent process: ${parent_process}"

if [ -n "${process_name}" ]; then
  for pid in $(ps -ef|grep "${process_name}"|grep -v "grep"|tr -s ' '|cut -d' ' -f2|tr -d ' '); do
    process_desc=$(ps -fp $pid --no-headers|tr -s ' ')

    case "$pid" in
      1)
        echo_log "$pid - skipping process 1"
        ;;
      ${my_process})
        echo_log "$pid - skipping my own process"
        ;;
      ${parent_process})
        echo_log "$pid - skipping my parent process"
        ;;
      *)
        if [ -n "${process_desc}" ]; then
          echo_log "killing $pid - ${process_desc}"
          sudo kill -9 $pid
        else
          echo_log "$pid - skipping empty process"
        fi
        ;;
    esac

  done
else
  echo_log "process name not specified"
fi

echo_log "DONE"
date
