#!/bin/bash

wget -qO- https://www.ynetnews.com/category/3082 | grep \
-E -o -i 'https://www.ynetnews.com/article/[a-z0-9]{9,10}' | uniq >filtered

  # this command filter only the url's of the articles and save them in file.

cat filtered | wc -l >> results.csv 

#saves the number of url's in the results.

while IFS= read -r line;
do
bibi=$(wget -qO- "$line" | grep -o 'Netanyahu' | wc -w)
benny=$(wget -qO- "$line" | grep -o 'Gantz' | wc -w)
echo -n "$line, " >> results.csv
if [[($bibi -eq 0) && ($benny -eq 0)]]; then echo "-" >> results.csv
else
echo "Netanyahu, $bibi, Gantz, $benny" >> results.csv; fi;
done<filtered

#for each ur'l we check how many times 
#'Netanyahu' and 'Gantz' appeared', and save the results the url.