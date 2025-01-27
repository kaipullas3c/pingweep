#!/bin/bash
START="\e[0;49;91m"
END="\e[0m"


#Banner
echo -e "                                          
      (_)                                   
 ____  _ ____   ____ _ _ _  ____ ____ ____  
|  _ \| |  _ \ / _  | | | |/ _  ) _  )  _ \ 
| | | | | | | ( ( | | | | ( (/ ( (/ /| | | |
| ||_/|_|_| |_|\_|| |\____|\____)____) ||_/ 
|_|           (_____|                |_|    
                      @johnthebug @kaipullas3c
                 
"

read -p "Enter ip address to be ping (ex: 192.168.54) : " ips
read -p "Enter the output file name:"  out
if [ "$ips" == "" ]
then
 echo " You forgot an ip address !"
else
  if [[ $ips =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} ]]
  then
    for ip in `seq 1  254`;
    do
      ping $ips.$ip -c 1 | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" >> $out.txt &
    done
   else
   echo "not valid: "$ips
   fi
fi

read -p "Do u want to run nmap on this ips (y or n):" ans
if [[ "$ans" == y||Y ]]
then
  for ipad in $(cat $out.txt) ;
  do
    nmap -Pn $ipad > mapped$out.txt
  done
else
  continue
fi
echo "Thanks for using the tool"

