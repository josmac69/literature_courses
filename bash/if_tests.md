# [IF tests](http://linux.freeideas.cz/subdom/linux/if-tests/ "Permalink to IF tests")

```
directory does not exist	if [ ! -d $directory ]; then … else … fi

directory exists	if [ -d $directory ]; then … else … fi

string contains substring	a="alphabet"; if [[ "$a" == "alpha"* ]]; then …. fi	* must be outside of the string, if substring should be inside string use *"something"*; at the end *"something"

string is null	if [ -z $testedstring ]; then … fi

file exists	[ -a $filename ] or [ -e $filename ] or [ -f $filename ]	-f mean regular file

symbolic link exists	[ -h $name ]

file exists and its size > 0	[ -s $filename ]

file exists and is executable	[ -x $filename ]

file exists and is writable	[ -w $filename ]

if previous command ended with error then end script with exit code 1	if [ $? != 0 ]; then echo "Error in command …."; exit 1; fi

test real number	if [ `echo "${some_variable} >= 0.5"|bc` -eq 1 ]; then … else … fi	Real numbers cannot be tested directly in [ ] using -lt, -ge etc. These tests work only with integer type. Therefore we need to feed expression int "bc" calculator which returns 0 / 1 as false / true.

if number is equal to some integer number	if [ $variable == 0 ]; then … else … fi

if number is NOT equal to some integer number	if [ $v != 0 ]; then … else … fi
```
