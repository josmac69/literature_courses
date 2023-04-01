# [TERM variable](http://linux.freeideas.cz/subdom/linux/term-variable/ "Permalink to TERM variable")


Sometimes when working in terminal command line you get error message like “variable TERM not set” and some commands refuse to work. Lately I had that problem with “top” command when I connected into pod running on Google container engine.

* easiest solution is to try “export TERM=linux” – as advised here: [http://stackoverflow.com/questions/14467809/how-to-set-term-to-a-value-when-running-bin-bash-via-command-line](http://stackoverflow.com/questions/14467809/how-to-set-term-to-a-value-when-running-bin-bash-via-command-line)
* or if you need some colors you can try “export TERM=xterm-256color” – as described here: [http://stackoverflow.com/questions/27188840/how-to-set-term-environment-variable-for-linux-shell](http://stackoverflow.com/questions/27188840/how-to-set-term-environment-variable-for-linux-shell)
