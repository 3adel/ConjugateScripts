#!/bin/bash
#This simple script checks what en->de translations are available from verbix and saves missing verbs in a seperate file. I researched the top 1000 verbs in english and ran the script against them. The result can be found in the file results.csv

BASE="http://api.verbix.com/translatorv2/json/35b1e140-257a-11e6-be88-00089be4dcbc/en/de/"
CURLARGS="-f -s -k -L"
TEMP="eat\n"
VERBS=`cat topEnglishVerbs.txt` #names from names.txt file
COUNTER=0

for VERB in $VERBS; do {
   #curl $CURLARGS $BASE$VERB   >> ./results.csv
   #echo "Checking verb $VERB via URL: $BASE$VERB"
   
   REQUEST=$(curl $CURLARGS $BASE$VERB)
   COUNTER=$[$COUNTER +1]   
    
   
   if [ $REQUEST = "[]" ]; then
        echo "$VERB" >> ./results.csv
        echo "$COUNTER: $VERB NOT FOUND"

   else 
        echo "$COUNTER: $VERB FOUND"
   fi   
}
done

