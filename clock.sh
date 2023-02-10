#!/bin/bash
second=1
m=$((`date +"%M"`+1-1))
h=$((`date +"%H"`+1-1))
s=$((`date +"%S"`+1-1))
echo $HOME
usr=`whoami`
echo "Hi, $usr"
rmdir $HOME/clock/*
mkdir $HOME/clock/s$s
mkdir $HOME/clock/m$m
mkdir $HOME/clock/h$h
funcMkdir(){
rmdir $HOME/clock/$name$(($1))
if [ $name = "m" ]
then
rmdir $HOME/clock/s60
fi
if [ $name = "h" ]
then
rmdir $HOME/clock/m60
fi
mkdir $HOME/clock/$name$(($1+1))
}
sixo=60
name="s"
while [ $s -le $sixo ]
do
name="s"
funcMkdir $s $name
if [ $s -eq $(($sixo-1)) ]
then
name="m"
s=00
funcMkdir $m $name
m=$(($m+1))
fi
if [ $m -eq $(($sixo-1)) ]
then
name="h"
m=00
funcMkdir $h $name
h=$(($h+1))
fi
s=$(($s+1))
sleep $second
done
