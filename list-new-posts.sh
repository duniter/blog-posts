#!/bin/bash
new_posts=`git ls-files --others --exclude-standard`
for post in "$new_posts";
do
#  echo $post
  for lang in en_EN fr_FR;
  do
    renamed=`echo "$post" | sed -e "s/\.md/\.$lang\.po/g"`
    po4a-gettextize -f text -m $post -p $renamed
  done;
done;