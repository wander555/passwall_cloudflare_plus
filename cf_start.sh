#!/bin/sh

#停止passwall
/etc/init.d/passwall stop

sleep 2s

cd CloudflareST/
./CloudflareST -dn 10


sleep 2s

echo "查询完毕，开始查询最快的IP"

#获取csv的第一条的IP
val1=($(sed -n '2p' result.csv ) )
array=(${val1//,/ })
anycast="${array[0]}"

echo "最快的IP为：$anycast"

#设置passwall的IP
uci set passwall.0a10f9b98b7641e5ad15381031d7ba37.address=$anycast
uci commit passwall

#启动passwall
/etc/init.d/passwall restart