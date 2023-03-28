# [Find full local path to given git repo](http://linux.freeideas.cz/subdom/linux/find-full-local-path-to-given-git-repo/ "Permalink to Find full local path to given git repo")

```
#!/bin/bash
reponame=$1
find ~/ -iname '.git' -print 2>/dev/null|grep "${reponame}/.git"|sed 's/.git//g'
```
