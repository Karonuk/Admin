#! /bin/bash

url="https://app.bitpool.com/#/login?pane=organisation" 
curl $url > site.html

value=`grep -iE "bpoappversion" site.html |grep -iEo "[0-9]+"`

hour=`date +"%H"`
minute=`date +"%M"`
echo -e "Time:"$hour":"$minute
amount=$(($hour+$minute))
if (($value<$amount))
then
echo -e "The entered number is less per hour and minute amount"

elif (($value>$amount))
then
echo -e "The entered number is more per hour and minute amount"

else 
 
echo -e "The entered number is equal to hour and minute amount"
fi
echo -e "$value $amount"
rm -rf site.html
