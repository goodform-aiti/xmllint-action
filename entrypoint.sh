#!/bin/bash
ERROR=0


echo " ************** MODIFIED FILES"

printf ${MODIFIED_FILES}

printf "\n*****************************\n"


echo "aaaa"
PATHS=$(printf ${MODIFIED_FILES} | tr \\n '\n')
echo "bbbb"
XML_FILES=$(grep -P '.+\.xml$' <<< $PATHS)

echo "$XML_FILES ***"

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
