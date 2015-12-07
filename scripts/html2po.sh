#!/bin/bash

# custom pages
for post in navigation featured cover;
do
	for lang in fr_FR;
	do
		renamed=`echo "$post.$lang.po"`
		po4a-gettextize -f text -m $post.html -p $renamed -M utf-8
	done;
done
