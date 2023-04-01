#!/bin/bash

dodelim1() {
echo "----------------------------------------------------------------------"
}

HISTSHOW=30
HISTFILE=~/.bash_history
IFS=$'\n'

set -o history

while true; do

    #feed fixed commands into array
    i=0
    commands[i]="exit"
    commands[++i]="...here your command...."
    commands[++i]="...here some other command..."

    #here commands based on files - just example
    for f in MyFileMask*; do
        if [[ ${f} == *".tar.bz2" ]]
        then
            commands[++i]="bunzip2 -c $(basename $f) |tar xf -; ls -l"
        else
            commands[++i]="rm -R $(basename $f)*; ls -l"
        fi
    done;

    commands[++i]="## ........................"

    #here commands from history
    for c in $(history ${HISTSHOW}|awk '{$1="";print substr($0,2)}'|sort|uniq); do
        if [[ ! ${c} == *"while true"* ]]
        then
            commands[++i]="${c}"
        fi
    done;

    #now write menu
    echo ""
    dodelim1

    echo "$i"
    for ((t=0; t<=i; t++)); do
        echo "${t} - ${commands[$t]}"
    done;

    dodelim1

    answer=""

    #now wait for user input
    while true; do
        read -e -p "$USER $(pwd): " answer
        echo ""
        echo "running: ${commands[$answer]}"
        if [ ! -z "${commands[$answer]}" ]
        then
            #run command from array
            eval "${commands[$answer]}"
            break
        fi
    done
done
