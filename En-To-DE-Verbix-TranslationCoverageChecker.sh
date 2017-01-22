#!/bin/bash
BASE="http://api.verbix.com/translatorv2/json/eba16c29-e22e-11e5-be88-00089be4dcbc/en/de/"
CURLARGS="-f -s -k"
TEMP="eat\n"

NAMES=`cat topEnglishVerbs.txt` #names from names.txt file

for NAME in $NAMES; do {
   curl $CURLARGS $BASE$NAME   >> ./results.csv
   echo "Checking verb $NAME via URL: $BASE$NAME"
}
done

