#! /bin/bash

RED="\033[31m"
GREEN="\033[32m"
END="\033[0m"
while true;
do
clear
echo -e "\t1.$GREEN User $END"
echo -e "\t2.$GREEN Date $END"
echo -e "\t3.$GREEN Time$END"
echo -e "\t4.$GREEN Homedir$END"
echo -e "\t5.$GREEN IP$END"
echo -e "\t6.$GREEN Last 10 logs$END"
echo -e "\t7.$GREEN All autorized users$END"
echo -e "\t8.$GREEN Up time$END"
echo -e "\t9.$RED exit$END"
 
read x
clear
case $x in  
    1)echo -e "$GREEN User:$END $RED $USER $END";;
    2)echo -e "$GREEN Date:$END $RED "`date +"%D"`"$END";;
    3)echo -e "$GREEN Time:$END $RED "`date +"%T"`"$END";;
    4)echo -e "$GREEN Homedir:$END$RED$HOME $END ";;
    5)echo -e "$GREEN IP:$END$RED"` ifconfig enp0s3|head -2|tail -1|awk '{print $2}'`"$END$RED";;
    6)cat /var/log/secure|tail -10;;
    7)w;;
    8)echo -e "$END$GREEN Up time$END$RED"`uptime`$END;;
    9)break   ;;
esac

sleep 1
done 

