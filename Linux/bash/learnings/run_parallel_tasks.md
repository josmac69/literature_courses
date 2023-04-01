# [Parallel run of tasks in bash script](http://linux.freeideas.cz/subdom/linux/parallel-run-of-tasks-in-bash-script-1/ "Permalink to Parallel run of tasks in bash script (1)")


Sooner or later you would face need to run several tasks in bash script in parallel and check exit codes.

Plain parallel run is simple and easy but without check of exit codes:

```
#!/usr/bin/env bash
start_task &
wait
echo "done"
```

Here is one way how to start limited number tasks (from some much higher number) in parallel and check for exit codes:

```
#!/usr/bin/env bash
debug=${DEBUG:-0}
vmaxjobs=8
 
function checkjobs {
  [ "$debug" == "1" ] && echo "checkjobs jobsarray dim: ${!jobsarray[@]}"
  [ "$debug" == "1" ] && echo "checkjobs jobsarray elements: ${jobsarray[@]}"
  for j in "${!jobsarray[@]}"; do
    [ "$debug" == "1" ] && echo "checking job: ${jobsarray[$j]}"
    wait ${jobsarray[$j]}
    rc=$?
    [ "$debug" == "1" ] && echo "job ${jobsarray[$j]} exit code: $rc"
    if [[ $rc -ne 0 ]] && [[ $rc -ne 127 ]]; then
      echo "$(basename $0): ERROR in job ${jobsarray[$j]} exit code $rc"
      exit 1
    fi
    [ "$debug" == "1" ] && echo "job ${jobsarray[$j]} OK"
    unset jobsarray[$j]
  done
}
 
function maxjobs {
  if [[ ${#jobsarray[@]} -ge $vmaxjobs ]]; then
    checkjobs
  fi
}
 
for x in something; do
  ## check max number of running tasks
  maxjobs 
 
  ## here you start your task in background
  start_task &   
 
  ## immediately get process ID of started task
  jobsarray=("${jobsarray[@]}" $!)
done
 
checkjobs
```
