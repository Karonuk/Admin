#! /bin/bash

function Main(){
while true
do
clear
echo -e "\t User Group"
echo -e "\t 1.User"
echo -e "\t 2.Group"
echo -e "\t 3.Show"
echo -e "\t Exit "
read prg
case $prg in
1)User ;;
2)Group ;;
3)Show ;;
exit)break ;;
Exit)break ;;
esac
done
}

function User(){
while true
do
clear
echo -e "\t User"
echo -e "\t 1.Creat"
echo -e "\t 2.Mod"
echo -e "\t 3.Del"
echo -e "\t Back"
read prg
case $prg in
1)UserCreat ;;
2)UserMod ;;
3)clear
echo -e " Name: "
read Name
userdel -fr $Name
;;
back)break ;;
Back)break ;;
esac 
done
}

function UserCreat(){
clear
while true
do
echo -e " Name: "
read name
if grep -iE "^$name" /etc/passwd > /dev/null ;
then
clear
echo -e " Error "
sleep 1
else
break
fi
done

while true
do
clear
echo -e " Uid: "
read UID
if grep -iE ":x:$UID:" /etc/passwd > /dev/null ;
then 
clear
echo -e " Error "
sleep 1
else
break
fi
done

while true
do
clear
echo -e " Gid: "
read Gid
if grep -iE ":[0-9]+:$Gid:" /etc/passwd > /dev/null ;
then
clear
echo -e " Error "
sleep 1
else
break
fi
done

while true
do
clear
echo -e " Expire:"
read Expire
if echo "$Expire" | grep -iE "[0-9]+{4}-[0-9]+{2}-[0-9]+{2}" > /dev/null ;
then
break
else
clear
echo -e " Error"
sleep 1
fi
done
groupadd -g $Gid $Name
clear
echo -e " Coment: "
read Coment
echo "$Name:$Uid:$Gid:$Expire:$Coment"
sleep 4
useradd $Name -u $Uid -g $Gid -e $Expire -c $Coment 
}

function UserMod(){
while true
do
clear
echo -e "\t User Mod"
echo -e "\t 1.Name"
echo -e "\t 2.Uid"
echo -e "\t 3.Gid"
echo -e "\t 4.Expire"
echo -e "\t 5.Coment"
echo -e "\t Back$END"
read prg
case $prg in
1)UserModN ;;
2)UserModU ;;
3)UserModG ;;
4)UserModE ;;
5)UserModC ;;
Back) break ;;
back) break ;;
esac
done
}

function UserModN(){
echo -e "$RED Name:$END"
read name
echo -e "$RED New name:$END"
read newName
usermod $name -l $newName
}

function UserModU(){
echo -e " Name:"
read name
while true
do
echo -e " New uid:"
read newUid
if grep -iE ":x:$newUid" /etc/passwd > /dev/null ;
then
clear
echo -e " Error "
sleep 1
else
break
fi
clear
done
usermod $name -u $newUid
}

function UserModG(){
echo -e " Name:"
read name
while true
do
echo -e " New Gid:"
read newGid
if grep -iE ":[0-9]+:$newGid" /etc/passwd > /dev/null ;
then
clear
echo -e " Error"
sleep 1
else
break
fi
clear
done
usermod $name -g $newGid
}

function UserModE(){
echo -e " Name:"
read name
while true
do
echo -e " New expire:$END"
read newEx
if echo "$newEx"|grep -iE "[0-9]+{4}-[0-9]+{2}-[0-9]+{2}" > /dev/null ;
then
break
else
clear
echo -e "Error"
sleep 1
fi
clear
done
usermod $name -e $newEx
}

function UserModC(){
echo -e " Name:"
read name
echo -e " New coment:"
read newCom
usermod $name -c $newCom
}

function Group(){
while true
do
clear
echo -e "\t Group"
echo -e "\t 1.Creat"
echo -e "\t 2.Mod"
echo -e "\t 3.Delete"
echo -e "\t Back"
read prg
case $prg in
1)GroupCreat ;;
2)GroupMod ;;
3)clear
echo -e "$RED Name:$END"
read name
groupdel $name ;;
back)break ;;
Back)break ;;
esac
done
}

function GroupCreat(){
clear
echo -e " Name:"
read name
while true
do
clear
echo -e " Gid:"
read Gid
if grep -iE ":$Gid" /etc/group > dev/null ;
then
clear
echo -e " Error"
sleep 1
else
break
fi
done
groupadd $name -g $Gid
}

function GroupMod(){
while true
do
clear
echo -e "\t Group Mod"
echo -e "\t 1.Name"
echo -e "\t 2.Gid"
echo -e "\t Back"
read prg
case $prg in
1)GroupModN ;;
2)GroupModG ;;
back)break ;;
Back)break ;;
esac
done
}

function GroupModN(){
echo -e " Name: "
read name
echo -e " New name: "
read newName
groupmod $name -l $newName
}

function GroupModG(){
echo -e " Name: "
read name
while true
do
echo -e " New Gid: "
read newGid
if grep -iE ":$newGid" /etc/group > /dev/null ;
then
break
else
clear
echo -e " Error "
sleep 1
fi
clear
done
groupmod $name -g $newGid
}

function Show(){
while true
do
clear
echo -e "\t Show"
echo -e "\t 1.User"
echo -e "\t 2.Group"
echo -e "\t Back"
read prg
case $prg in
1)clear
cut -d: -f1 /etc/passwd
sleep 4 ;;
2)clear
cut -d: -f1 /etc/group
sleep 4 ;;
back)break ;;
Back)break ;;
esac
done
}

Main
