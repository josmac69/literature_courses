# users and groups

### Groups
* create new group: `sudo groupadd groupname`
### Users
* add existing user into group: `sudo usermode -G groupname username`
* remove user from group: `sudo deluser username groupname`
* show groups user belongs into: `groups username`
* show all users belonging into some group: `sudo cat /etc/group|grep groupname`
** `members groupname`
