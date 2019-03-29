#!/bin/sh

#!/bin/sh

cd /etc/unbound
cat blocking.conf.head > blocking.conf
/usr/bin/python3 gen_adblocker.py 127.0.0.1 >> blocking.conf
curl https://warui.intaa.net/adhosts/local_data.conf.txt | sed -e 's/IN A 0.0.0.0/IN A 127.0.0.1/g' > warui_intaa_blocking.conf

/etc/init.d/unbound restart

