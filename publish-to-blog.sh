#!/bin/bash

# -------------- CONFIG TO BE CHANGED --------------
TARGET=http://localhost:2368
USER=admin@localhost
PASSWORD="12345678"
EXPORT_LANG=fr_FR
# -------------------------------------------------

echo "Publishing..."
scripts/publish.sh ${TARGET} ${USER} "$PASSWORD" ${EXPORT_LANG}

echo ">> The blog has been updated successfully!"
