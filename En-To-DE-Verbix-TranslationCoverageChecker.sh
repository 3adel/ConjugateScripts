#!/bin/bash
#This simple script checks what en->de translations are available from verbix and saves missing verbs in a seperate files. I researched the top 1000 verbs in english and ran the script against them. The result can be found in the file results.csv

BASE="http://api.verbix.com/translatorv2/json/eba16c29-e22e-11e5-be88-00089be4dcbc/en/de/"
CURLARGS="-f -s -k -L"
TEMP="eat\n"
NAMES=`cat topEnglishVerbs.txt` #names from names.txt file
COUNTER=0

for NAME in $NAMES; do {
   #curl $CURLARGS $BASE$NAME   >> ./results.csv
   #echo "Checking verb $NAME via URL: $BASE$NAME"
   
   REQUEST=$(curl $CURLARGS $BASE$NAME)
   COUNTER=$[$COUNTER +1]   
    
   
   if [ $REQUEST = "[]" ]; then
        echo "$NAME" >> ./results.csv
        echo "$COUNTER: $NAME NOT FOUND"

   else 
        echo "$COUNTER: $NAME FOUND"
   fi   
}
done

