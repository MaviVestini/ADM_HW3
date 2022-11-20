#!/bin/sh

array=("Italy" "Spain" "France" "England" "United States")           # array of countries

for val in "${array[@]}"; do                                         # interating in array
     
    output=$(cut -f3 _places_data_.csv | grep "$val" | wc -l)        # grep country from 3rd columns of csv and do word count
    echo "How many places can be found in $val? $output places"      # print result
    
    output2=$(cut -f1,3 all_places_data.csv | grep "$val"| awk -F"," '{sum+=$1} END {print sum/NR}') 
    
                                             # grep country then sum over the 1st column (numPeopleVisited) divided by len of records
            
    echo "How many people, on average, have visited the places in $val? $output2 people"          
    
    output3=$(cut -f2,3 all_places_data.csv | grep "$val"| awk -F"," '{sum+=$2} END {print sum}')   # grep country and sum over the 2nd column (numPeopleWant)
    echo -e "How many people in total want to visit the places in $val? $output3 people\n"          # print result
    
done



