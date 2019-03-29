#!/usr/bin/python3
# coding: utf-8

import sys
dns_server = "127.0.0.1"
if len(sys.argv) == 2:
    dns_server = sys.argv[1]

local_zone_entry = 'local-zone: "{}." static'
#local_zone_entry = 'local-zone: "{}." redirect'
#local_data_entry = 'local-data: "{}. IN A {}"'.format("{}", dns_server)

import urllib.request
headers = { "User-Agent" :  "Mozilla/4.0 (compatible; MSIE 5.5; Windows NT)" }
def get_hosts_from_url(url):
    req = urllib.request.Request(url, None, headers)
    with urllib.request.urlopen(req) as res:
        body = res.read().decode("utf-8-sig")

    lines = []
    for line in body.split('\n'):
        line = line.strip()
        if line == '' or line.startswith("#"):
            continue
        lines.append(line)

    return list(set(lines))

def gen_unbound_conf_lies(hosts):
    conf = []
    hosts = get_hosts_from_url(url)
    for host in hosts:
        conf.append(local_zone_entry.format(host))
#        conf.append(local_data_entry.format(host))
    return '\n'.join(conf)

urls = ('https://280blocker.net/files/280blocker_host.txt',
        'https://raw.githubusercontent.com/anudeepND/youtubeadsblacklist/master/domainlist.txt')
for url in urls:
    print(gen_unbound_conf_lies(url))

