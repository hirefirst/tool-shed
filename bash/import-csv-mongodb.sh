#!/usr/bin/env bash
CSVFILE=$1
echo ""
echo "Importing: $CSVFILE"
FIELDS=`head -1 $1 | sed -e 's/\",\"/,/g'`
echo "Fields: $FIELDS"
echo ""
echo "Database ?"
read DB
echo "Collection?"
read COLLECTION
echo "Importing to $DB.$COLLECTION ? (y|n)"
read CONSENT
if [ "$CONSENT" != "y" ]; then
    echo ""
    echo "Import interrupted."
    echo ""
fi
mongoimport -d $DB -c $COLLECTION --type=CSV --file=$CSVFILE --headerline

