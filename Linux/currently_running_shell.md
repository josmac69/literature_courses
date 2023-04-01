# currently running shell / default shell

* to check which shell is currently running just type: `ps $$`
* to get only shell name from this output use: `ps -h -o cmd $$`
warning – if you try to use it in script and script has `#!/…` in first line then of course you will get as output this.
So in script – if you for example want to modify PATH in users .rc file – you need to check default shell using /etc/passwd file:
`basename $(cat /etc/passwd|grep $USER|cut -d':' -f7)`
to feed it into variable:
`defaultshell=$(basename $(cat /etc/passwd|grep $USER|cut -d':' -f7))`

