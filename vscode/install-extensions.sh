#!/bin/bash

filename="extensions.txt"

while read -r line
do
  name="$line"
  echo `code --install-extension $name`
done < "$filename"
