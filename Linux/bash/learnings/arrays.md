# [Arrays](http://linux.freeideas.cz/subdom/linux/arrays/ "Permalink to Arrays")


In bash we can use:

* indexed arrays – one dimensional array, index is number, starting from zero, no limit on the number of elements -> declaring is not required, just add value into indexed variable
* associative arrays – indexes are strings -> must be declared, works only in bash 4 and above (check it with command: bash –version)

Indexed array:

* can be initialized using one of these special assignments:
  * myarray=(every word will be stored in different element)
  * myarray=([0]=every [1]=word ….)
* after this initialization elements are accessible as usual:
  * myarray[0], myarray[1], etc.

Operations with indexed arrays:

* ${myarray[n]} -> use value of element n of myarray
* ${myarray} -> use first element (index 0) of myarray
* ${myarray[*]} or ${myarray[@]} -> use all elements of myarray
* ${#myarray[*]} or the same with @ -> use number of elements in myarray

Associative arrays:

* must be declared:
  * declare -A myarray
* assignment can be done like these:
  * myarray[john]=something; myarray[paul]=somethingelse;
  * myarray([john]=something [paul]=somethingelse)
  * you can use quotes but it does not have any efect: myarray[“john”] or myarray[‘john’] is the same as myarray[john]
* usage of the values:
  * echo “${myarray[john]}”
* index can be stored in other variable:
  * indexvar=john
  * ```
    echo “${myarray[$indexvar]}”
    ```
* loop over keys:
  * ```
    for variable in “${!myarray[@]}”; do
    echo $variable;  #-> prints index
    echo ${myarray[$variable]}; #-> prints value
    done
    ```
* unseting of the whole array:
  * unset myarray
* deleting keys:
  * unset myarray[john]
* number of keys in array:
  * echo ${#myarray[@]}
