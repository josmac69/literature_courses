# [Command forms](http://linux.freeideas.cz/subdom/linux/command-forms/ "Permalink to Command forms")

```
command & -> exectue command in backgroud
command1; command2 -> command sequence – executes multiple commads on the same line (you can use this to write quite long scripts in one command line)
(command1; command2; …) -> executes commands as a group in a subshell (f.e. you can this way feed result into variable like a=$(command) of to redirect all output (ls; date; who) > logfile.txt )
{ command1; command2; } -> executes commands as a group in the current shell
command1 | command2 -> pipe = use output from command1 as input to command2
command1 && command2 -> AND = if command1 fails then command2 is NOT executed
command1 || command2 -> OR = if command1 is succesfull then command2 is NOT executed; command2 is executed ONLY when command1 fails
! command -> reverts status returned by command
command $((expression)) -> POSIX shell arithmetic substitution – uses result of expression as argument to command
command1 $(command2) -> POSIX shell command substitution
command1 `command2` -> command substitution = use command2 output as raguments to command1
```
