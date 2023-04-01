# iptables


* list existing rules: “sudo iptables -S”
* list rules as table: “sudo iptables -L”
* clear counters for rules: “sudo iptables -Z”
* block specific IP: “sudo iptables -A INPUT -s xxx.xxx.xxx.xxx -j DROP”
