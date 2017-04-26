#! /bin/bash

mac="00:11:22:33:44:55"
adsl="990000736891"
sn="00TF`date +%s%N | cut -b-13`009262"
cid="BFEBFBFF`date +%s%N | cut -b-18`"

infoUrl="http://bj.wokuan.cn/web/startenrequest.php?ComputerMac=$mac&ADSLTxt=$adsl&Type=2&reqsn=$sn&oem=00&ComputerId=$cid"
eval `curl -s "$infoUrl" | grep -m1 -Po 'ov=[^<]*' | sed 's#&#\n#g'`

boostUrl="http://bj.wokuan.cn/web/improvespeed.php?ContractNo=$cn&up=$gus&old=$old&round=$random"
curl -s "$boostUrl" 

heartbeatUrl="http://bj.wokuan.cn/web/updateforfifteenmin.php?Mactxt=$cid&ADSLTxt=$adsl&Tick=7777777&OEM="

while [[ 1 ]]
do
    sleep 60
    curl -s $boostUrl
done
