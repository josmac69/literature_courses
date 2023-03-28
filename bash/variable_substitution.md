# [Variable substitution](http://linux.freeideas.cz/subdom/linux/variable-substitution/ "Permalink to Variable substitution")


* variable=value -> sets “value” to “variable”
* ${variable} -> use value of “variable” – braces are optional if variable is separated from other following text but are required for array
* ${variable:-value} -> substitution for not set variable without change in variable = use variable if set, otherwise use value but do nothing with variable
* ${variable:=value} -> substitution for not set variable WITH change in variable = use variable if set, otherwise use value and SET it also into variable
* ${#variable} -> use the length of variable
* ${variable:position} -> substring from variable, starting at “position” (0=start position) till the end of string
* ${variable:position:length} -> the same as previous, with specified length of substring
* ${variable/pattern} -> use value from variable and delete first match of “pattern”
* ${variable/pattern/replacement} -> use value from variable and first match of “pattern” replace with “replacement”
* ${variable//pattern/replacement} -> use value from variable and all matches of “pattern” replace with “replacement”
* ${!variable} -> use value of variable as name of other variable from which variable should be really used
