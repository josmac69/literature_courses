# [Update all local git repos](http://linux.freeideas.cz/subdom/linux/update-all-local-git-repos/ "Permalink to Update all local git repos")

```
#!/bin/bash
 
echo "==========================================="
echo "REFRESH GIT REPOS"
date
 
for repo in $(find ~/ -iname '.git' -print 2>/dev/null|sed 's/.git//g'); do
echo "$repo"
cd "$repo"
git pull
if [ ! $? -eq 0 ]; then
echo "error in repo $repo"
fi
echo ""
done
 
echo "REFRESH DONE"
date
```
