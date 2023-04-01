##### Bash is very powerful scripting language for quick development without big “hustle and bustle”. One of very powerful features are background processes. Here is small script I used for my testing. I believe it can be good inspiration for others.

```
#!/usr/bin/env bash
 echo "starting test: $$"
 declare -a results
 declare -a processes
 declare -a outputs
 declare -a files
 count=0
 echo $coount
 let "count++"
 { sleep 1; echo "done OK: $$ $BASHPID" > /tmp/out$BASHPID; } &
 processes[$count]=$!
 echo "${processes[$count]}"
 let "count++"
 { sleep 5; echo "test message: $$ $BASHPID" > /tmp/out$BASHPID; exit 1; } &
 processes[$count]=$!
 echo "${processes[$count]}"
 echo "all started"
 for i in `seq 1 ${count}`; do
         echo $i
         wait ${processes[$i]}
         results[$i]="$?"
         files[$i]=/tmp/out${processes[$i]}
         echo "${files[$i]}"
         outputs[$i]=$(cat ${files[$i]})
         rm ${files[$i]}
         echo "$i - result: ${results[$i]}, output: ${outputs[$i]}"
 done
 ## output all results again as summary at the end to avoid results would be lost in other output from p$
 echo "all done:"
 for i in `seq 1 ${count}`; do
         echo "$i - result: ${results[$i]}, output: ${outputs[$i]}"
 done
```
