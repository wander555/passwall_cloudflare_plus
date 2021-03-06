#!/bin/sh

#停止passwall
/etc/init.d/shadowsocksr stop

sleep 2s

cd CloudflareST/
./CloudflareST -dn 10

sleep 2s

echo "查询完毕，开始查询最快的IP"
#获取csv的第一条的IP
val1=$(sed -n '2p' result.csv )

oldIFS=$IFS
IFS=","
set -- ${val1}
# echo "$1"
anycast="$1"
IFS=$oldIFS

# anycast="${array[0]}"

echo "最快的IP为：$anycast"

#设置passwall的IP
uci set shadowsocksr.@servers[1].server=$anycast
uci commit shadowsocksr

#启动passwall
/etc/init.d/shadowsocksr restart

