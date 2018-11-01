#bash /bin/bash

RED="\033[31m"
GREEN="\033[32m"
END="\033[0m"

function stat(){

city=`awk '{print $6}' /root/phonebook`
for i in $city;
do
if grep $i /root/cityfile > /dev/null ; 
then
continue

else
 
echo "$i" >> /root/cityfile

fi

done
statWr

sleep 1
}
function statWr(){

cityWrite=`cat /root/cityfile`

for i in $cityWrite
do
counter=`grep -c $i phonebook`

if grep "$counter: $i" /root/citysort>/dev/null;
then
continue
else
echo "$counter: $i" >> /root/citysort
fi
done

cat /root/citysort|sort -rg  
}
function mailStat() {

mail=`awk '{print $5}' /root/phonebook | grep -oEi "[@][a-z]+"`
for i in $mail
do 
if grep "$i" /root/mail>/dev/null
then
continue
else
echo "$i" >> /root/mail
fi
done
mailF
}
function mailF(){
cmail=`cat /root/mail`
for i in $cmail
do
countermail=`grep -c "$i" /root/phonebook`
echo -e "$i:$countermail"
done 
}
function Search(){
while true;
do 
clear
echo -e "\tSearch by"
echo -e "$GREEN\t1.Mail"
echo -e "\t2.Phone"
echo -e "\t3.Surname"
echo -e "\t4.City$END"
echo -e "$RED\tBack$END"
read y

case $y in
1)read fin
grep -iE "^[a-z]+ [a-z]+ [0-9]+ [0-9]+ $fin *" /root/phonebook
;;
2)read fin
grep -iE "^[a-z]+ [a-z]+ [0-9]+ $fin *" /root/phonebook ;;
3)read fin
grep -iE "^[a-z]+ $fin+ *" /root/phonebook
 ;;
4)read fin
grep -iE "^[a-z]+ [a-z]+ [0-9]+ [0-9]+ [0-9|a-z|@|.]+ $fin *" /root/phonebook
 ;;
'back')
break ;;
'Back')
break ;;
esac
sleep 2;
done
}
function ageStat(){

counter1=`awk '{print $3}' /root/phonebook|grep -c "[0-1][0-88888888]" `
echo "Les than 18:$counter1"
counter2=`awk '{print $3}' /root/phonebook|grep -c "19" `
counter3=`awk '{print $3}' /root/phonebook|grep -c "2[0-9]"`
counter4=$((counter2+$counter3))
echo "19-29:$counter4"
counter5=`awk '{print $3}' /root/phonebook|grep -c "[3-9][0-9]"`
echo "30>:$counter5"
}




while true;
do
echo -e "$GREEN\t1.Statistics$END"
echo -e "$GREEN\t2.Mail statistics$END"
echo -e "$GREEN\t3.Search$END"
echo -e "$GREEN\t4.Age statistic$END"
echo -e $RED "\tExit$END"
read x
case $x in
1)stat;;
2)mailStat;;
3)Search;;
4)ageStat;;
'Exit')break;;
'exit')break;;
esac
sleep 2
clear

done






