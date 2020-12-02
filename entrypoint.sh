#!/bin/bash
set -e


echo " ************** MODIFIED FILES"

printf ${MODIFIED_FILES}

echo " ******************************"

PATHS=$(printf ${MODIFIED_FILES} | tr \\n '\n')
XML_FILES=$(grep -P '.*\.xml' <<< $PATHS)
echo "$XML_FILES" | while read FILE ; do
    echo $FILE
#     if [[ ! -f $CORE_FILE ]]
#     then
#       # skip deleted files
#       continue
#     fi
#     if xmllint $FILE --noout ; then
#       echo "xml-syntax is fine: $FILE"
#     else
#       echo "syntax error in: $FILE"
#     fi
done


#xmllint $1 --schema $2 --noout
