#!/bin/bash

# new posts
for lang in fr_FR en_EN;
do
  for post in `ls posts/*.md`;
  do
    renamed=`echo -e "$post" | sed -e "s/\.md/\.$lang\.po/g"`
    if [[ ! -f "$renamed" ]]; then
      #echo "$renamed does not exist"
      po4a-gettextize -f text -m $post -p $renamed -M utf-8
    fi
  done;
done;
