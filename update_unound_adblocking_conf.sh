#!/bin/sh

#!/bin/sh

cd /etc/unbound
cat blocking.conf.head > blocking.conf
#/usr/bin/python3 gen_adblocker.py 127.0.0.1 >> blocking.conf
#curl https://warui.intaa.net/adhosts/local_data.conf.txt | sed -e 's/IN A 0.0.0.0/IN A 127.0.0.1/g' > warui_intaa_blocking.conf

/usr/bin/python3 gen_adblocker.py 0.0.0.0 >> blocking.conf
#curl https://warui.intaa.net/adhosts/local_data.conf.txt > warui_intaa_blocking.conf
curl https://warui.intaa.net/adhosts/local_zone.conf.txt > warui_intaa_blocking.conf
curl https://warui.intaa.net/adhosts/local_zone_ipv6.conf.txt > warui_intaa_blocking.conf
curl https://warui.intaa.net/adhosts/local_data.conf.txt >> warui_intaa_blocking.conf
curl https://warui.intaa.net/adhosts/local_data_ipv6.conf.txt >> warui_intaa_blocking.conf
curl https://warui.intaa.net/adhosts/local_data_malware.conf.txt >> warui_intaa_blocking.conf
curl https://warui.intaa.net/adhosts/local_data_malware_ipv6.conf.txt >> warui_intaa_blocking.conf

sed -i -e '/m.media-amazon.com./d' blocking.conf

sed -i -e '/s.click.aliexpress/d' warui_intaa_blocking.conf
sed -i -e '/analytics.twitter.com/d' warui_intaa_blocking.conf
sed -i -e '/cloudfront.net/d' warui_intaa_blocking.conf
sed -i -e '/googleusercontent.com/d' warui_intaa_blocking.conf
sed -i -e '/analytics.edgekey.net/d' warui_intaa_blocking.conf

sed -i -e '/naver.jp/d' warui_intaa_blocking.conf
sed -i -e '/line.me/d' warui_intaa_blocking.conf
sed -i -e '/lineblog.me/d' warui_intaa_blocking.conf
sed -i -e '/line-cdn.net/d' warui_intaa_blocking.conf
sed -i -e '/line-scdn.net/d' warui_intaa_blocking.conf

mkdir -p /tmp/www
cp blocking.conf warui_intaa_blocking.conf /tmp/www/
/etc/init.d/unbound restart

