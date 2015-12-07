#!/bin/bash

root=`pwd`
export_dir=$root/export
languages=fr_FR

# Each export has a target language
for lang in $languages;
do
  # Clean export directory
  rm -Rf $export_dir/$lang
  mkdir -p $export_dir/$lang
  source_languages=`ls $root/meta/*_*.txt | xargs -n1 basename | sed -e 's/\.txt//g' | tr '\n' ' '`
  for srclang in $source_languages;
  do
    # Add the article only if translated at 100%
    keep=100
    if [[ "$srclang" == "$lang" ]]; then
      # Exception is when post original language is export language
      keep=0
    fi
    posts_of_lang=`cat $root/meta/$srclang.txt`
    for post in $posts_of_lang;
    do
      post_lang=`echo $post | sed -e "s/\.md/\.$lang\.po/g"`
      echo "Found $srclang post:" $post_lang
      final=$export_dir/$lang/published-$post
      if [[ -f posts/$post_lang ]]; then
        #Do the translation magical
        po4a-translate -f text -m posts/$post -p posts/$post_lang -l $final -M utf-8 --keep $keep
        if [[ -f $final ]]; then
          # Clean result since po4a-gettextize broke many things...
          cat $final | tr '\n' '%' \
            | sed -e 's/\([0-9]\)%/\1µ/g' \
            | sed -e 's/\([^%]\)%\([^%*>]\)/\1 \2/g' \
            | sed -e 's/%\*\*/ \*\*/g' \
            | sed -e 's/[^>] \(##\+\)/\n\n\1/g' \
            | sed -e 's/%/\n/g' \
            | sed -e 's/µ/%/g' \
            | sed -e 's/ \{2,\}/ /g' \
             > "$final.2"
          # Erase translated file with corrections
          mv $final.2 $final
        fi
      elif [[ $keep = 0 ]]; then
        #Direct copy to export since we do not need translation
        cp posts/$post $final
      else
        echo ">> post $post_lang will not be included since it is not translated but requires to be."
      fi
    done;
  done;

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
for lang in $languages;
do
  export_zip="export/export_$lang.zip"
  if [[ -f "$export_zip" ]]; then
    rm $export_zip
  fi

  zip -9 -j -r $export_zip export/$lang/*
done;
