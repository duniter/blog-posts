#!/bin/bash

root=`pwd`
export_dir=$root/export
for lang in fr_FR en_EN;
do
  mkdir -p $export_dir/$lang
	for post in `cat $root/published/$lang.txt`;
	do
    post_lang=`echo $post | sed -e "s/\.md/\.$lang\.po/g"`
    if [[ -f posts/$post_lang ]]; then
      final=$export_dir/$lang/published-$post
      po4a-translate -f text -m posts/$post -p posts/$post_lang -l $final -M utf-8
      if [[ -f $final ]]; then
	      cat $final | tr '\n' '%' \
		| sed -e 's/\([^%]\)%\([^%*>]\)/\1 \2/g' \
		| sed -e 's/%\*\*/ \*\*/g' \
		| sed -e 's/[^>] \(##\+\)/\n\n\1/g' \
		| sed -e 's/%/\n/g' | sed -e 's/ \{2,\}/ /g' \
		 > "$final"
      fi
    else
      echo ">> post$post_lang does not exit" 
    fi
	done;

  export_zip="export/export_$lang.zip"
  if [[ -f "$export_zip" ]]; then
    rm $export_zip
  fi
  zip -9 -j -r $export_zip export/$lang/*

	## custom pages
	#for post in navigation featured;
	#do
		#po4a-translate -f text -m $root/posts/posts/$post.html -p $root/posts/posts/$post.$lang.po -l $root/posts/posts/$post.$lang.html
		#cp $root/posts/posts/$post.$lang.html $root/$lang/content/themes/ghostium/partials/custom/$post.hbs
	#done;

	## partial pages
	#for post in cover;
	#do
		#po4a-translate -f text -m $root/posts/posts/$post.html -p $root/posts/posts/$post.$lang.po -l $root/posts/posts/$post.$lang.html
		#cp $root/posts/posts/$post.$lang.html $root/$lang/content/themes/ghostium/partials/$post.hbs
	#done;
done;
