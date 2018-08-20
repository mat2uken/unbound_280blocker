#!/usr/bin/python3
# coding: utf-8

import urllib.request

url = 'https://280blocker.net/files/280blocker_host.txt'
headers = { "User-Agent" :  "Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)" }

req = urllib.request.Request(url, None, headers)
with urllib.request.urlopen(req) as res:
    body = res.read().decode("utf-8-sig")

#blocking_conf_file = open("blocking.conf", "wb")

local_zone_entry = 'local-zone: "{}." static'
for line in body.split('\r\n'):
    line = line.strip()
    if line == '' or line.startswith("#"):
        continue
#    blocking_conf_file.write(local_zone_entry.format(line).encode() + b"\n")
    print(local_zone_entry.format(line))
