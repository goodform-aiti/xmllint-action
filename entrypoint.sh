#!/bin/bash
ERROR=0


#PATHS=$(printf ${MODIFIED_FILES} | tr \\n '\n')
PATHS=$(find . -type f -name '*.xml' ! -name 'wsdl.xml' ! -name 'wsdl2.xml' ! -name 'wsi.xml')
XML_FILES=$(grep -P '.+\.xml$' <<< $PATHS)

echo "$XML_FILES" | while read FILE ; do
    if ! xmllint "$FILE" --noout ; then
      echo "xml-syntax error found in: $FILE"
      exit 101
    fi
done
