# XML Lint Action

This action validates an xml files with a given xml schema using xmllint.


## Example usage

```yml
name: Lint

on: [push]

jobs:
  xml-linters:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@master
    - name: Download schema
      run: wget https://apps.nextcloud.com/schema/apps/info.xsd
    - name: Lint info.xml
      uses: ateli-development/xmllint-action@master
      env
        MODIFIED_FILES: ${{ steps.file_changes.outputs.files}}
```
