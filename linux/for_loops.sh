#!/bin/bash
states=( 'Nebraska' 'California' 'Utah' 'Hawaii' 'Alabama' 'Ohio' )
numbers=$(echo {0..9})
ls_out=$(ls)
files=$(find /home -type f -perm 777 2> /dev/null)

for file in ${files[@]}
do
   echo $file
done



for x in ${ls_out[@]}
do
    echo $x
done


for states in ${states[@]}
do 
     if [ $states == "Hawaii" ];
     then
            echo "Hawaii is the best!"
     else
            echo "I'm not a fan of Hawaii."
fi
     done

for num in ${numbers[@]}
     do
     if [ $num -eq 3 ] || [ $num -eq 5 ] || [ $num -eq 7 ];
     then
            echo $num
fi
done

