#! /bin/sh.
echo 'We solve this questions using AWK in bash and cmd environment'  

echo 'Question 1. Which location has the maximum number of purchases been made?'

awk -F ',' '{print $5}' bank_transactions.csv | sort | uniq -c | sort -nr | head -5 > Locations.csv

echo 'It exports a csv file containing the result in the same folder which you execute the command in'

echo 'echo 'Question 2. In the dataset provided, did females spend more than males, or vice versa?'

echo 'We should get the average of females purchases: '

awk -F ',' '$4=="F" {sum+=$9 ; cnt++} END {print sum/cnt}' bank_transactions.csv

echo 'We should get the average of men purchases: '

awk -F ',' '$4=="M" {sum+=$9 ; cnt++} END {print sum/cnt}' bank_transactions.csv

echo 'At the end by comparing we can get that females spent more than males'

echo 'Question 3. Report the customer with the highest average transaction amount in the dataset. '

awk -F ',' '{s[$2]+=$9; cnt[$2]++} END{for (x in s)print  s[x]/cnt[x],x}' bank_transactions.csv | sort -nr | head -n 1 > SpecialCustomer.csv