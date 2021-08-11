#!/bin/bash

#Activity 2 list and for loop
best_states=('New Mexico' 'Texas' 'Massachusetts' 'California' 'Hawaii')


for state in ${best_states[@]}
do
	if [ $state == 'Hawaii' ];
	then
	echo "Hawaii is the best!"
	else
	echo "I'm not a fan of Hawaii"
	fi
done

#Activity 2 Bonus
my_numbers=$(echo {0..9})

for number in ${my_numbers[@]}
do
if [ $number = 3 ] || [ $number = 5 ] || [ $number = 7 ]
then
echo $number
fi
done

