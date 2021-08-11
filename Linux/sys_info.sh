#!/bin/bash

if [ $UID != 0 ]
then
echo "Do not use this script without sudo"
exit
fi

#Using Vriables
output=$HOME/scripts/sys_info.txt
IP=$(ip addr | grep inet | tail -2 | head -1)
exes=$(find /home -type f -perm 777)

#Using if Statements
if [ ! -d $HOME/research ]
then
mkdir $HOME/research
fi

if [ -f $output ]
then
rm $output
fi

#My First Bash Script Activity
echo -e "Today is: $(date)\n" >> $output
echo -e "The uname info is: $(uname)\n" >> $output
echo -e "This machine type is: $MACHTYPE\n">> $output
echo -e "The IP address is: $IP \n">> $output
echo -e "The host is: $HOSTNAME\n">> $output

# Activity 1 Bonus
echo -e "DNS Info:\n" >> $output
cat /etc/resolv.conf
echo -e "\nMemory Info:\n" >> $output
free
echo -e "\nCPU Info:\n" >> $output
lscpu | grep CPU
echo -e "\nDisk Usage:\n" >> $output
df -H | head -2
echo -e "\nCurrently Logged in Users:\n $(who) \n" >> $output

#Custom Commands Activity (Continued)
echo -e "\n777 Files: $exes" >> $output
echo -e "\nTop 10 Processes" >> $output
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> $output


#Useful Loops
sp=('/etc/shadow' '/etc/passwd')
for perm in ${sp[@]}
do
ls -l $perm >> $output
done

#Useful Loops Bonus
for user in $(ls /home)
do
	sudo -lU $user
done
