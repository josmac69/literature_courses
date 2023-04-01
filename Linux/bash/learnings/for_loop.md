
# [FOR cycle](http://linux.freeideas.cz/subdom/linux/for-cycle/ "Permalink to FOR cycle")

```
cycle over list of values – values directly written command
for cnt in 1 2 3 4 ; do .... done

cycle over list of values – values taken from variable
NAMES="John Alan Jane"
for PERSON in ${NAMES} ; do .... done

cycle over list of values – list in variable for example as result of PostgreSQL db query
listofsomething=$(psql .... )
for item in $listofsomething; do
....
done

"classical" for loop over interval of values
for i in {1..5}; do .... done
syntax: {start..stop..step}

java-like for loop
for (( i=1; i<=5; i++ )); do .... done
syntax: init value; condition; increment

for loop over files
for f in /mydirectory/myfilemask*; do .... done
if you specify full path in loop then: $f contains full filename with path $(basename $f) gives only filename without path $(dirname $f) gives only path without filename

for loop over data containing space characters – ignores spaces and takes as delimiter only new line characters
IFS=$'\n'; for f in $(ls -l); do .... done
IFS contains characters which should be considered as delimiters

```
