# [Arguments and built-in shell variables](http://linux.freeideas.cz/subdom/linux/arguments/ "Permalink to Arguments and built-in shell variables")

```
$0 = nabe of the script
$# = number of command line arguments of the script
$1, $2, … = arguments of the script
$*, $@ = all arguments from command line
“$*” = all arguments as one string -> “$1 $2 …”
“$@” = all arguments with quotes -> “$1” “$2” …
$? = exit value of last command
$- = options used by script
$$ = process number of the shell
$! = process number of last background command
```
