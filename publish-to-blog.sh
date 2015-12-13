#!/bin/bash

# -------------- CONFIG TO BE CHANGED --------------
TARGET=http://fr.ucoin.io
USER=someuser@blog.info
PASSWORD="ultraSafePassword with spaces and stuff!"
EXPORT_LANG=fr_FR
# -------------------------------------------------

ZIP_WITH_POSTS=./export/export_$EXPORT_LANG.zip

echo "Translating..."
scripts/translate_and_export_and_zip.sh

echo "Publishing..."
scripts/publish.sh $TARGET $USER "$PASSWORD" $ZIP_WITH_POSTS $EXPORT_LANG

echo ">> The blog has been updated successfully!"
