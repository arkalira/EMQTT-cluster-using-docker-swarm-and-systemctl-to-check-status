#!/bin/sh
for i in $(docker ps | grep Up | awk '{print $1}')
do
    echo "Checking container: " $i
	docker exec $i sh -c "./bin/emqttd_ctl cluster status" | grep master > /dev/null 2>&1
	if [ $? -eq 1 ]
	then
		echo "Rejoining cluster EMQTT"
	    docker exec $i sh -c "./bin/emqttd_ctl cluster join emqtt@tasks.master" > /dev/null 2>&1
	else
		echo "Cluster is OK"
	fi
done
exit
