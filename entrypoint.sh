#!/bin/bash
set -e
ERROR=0


echo " ************** MODIFIED FILES"

printf ${MODIFIED_FILES}

printf "\n*****************************\n"

PATHS=$(printf ${MODIFIED_FILES} | tr \\n '\n')
XML_FILES=$(grep -P '.+\.xml$' <<< $PATHS)


echo "$XML_FILES" | while read FILE ; do
    if [[ ! -f $FILE ]]
    then
      # skip deleted files
      continue
    fi
    if xmllint $FILE --noout ; then
      echo "xml-syntax is fine: $FILE"
    else
      ERROR=101
    fi
done

exit ${ERROR}


#xmllint $1 --schema $2 --noout
