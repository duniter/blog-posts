#!/bin/bash

if  [[ -z $1 ]] ||  [[ -z $2 ]] ||  [[ -z $3 ]] || [[ -z $4 ]] || [[ -z $5 ]]; then
	echo "The script requires 6 parameters";
	exit 1;
fi

if  [[ $1 != http* ]]; then
	echo "First parameter must be an URL";
	exit 2;
fi

if  [[ $2 != *@* ]]; then
	echo "Second parameter must be an e-mail";
	exit 3;
fi

if  [[ ! -f $4 ]]; then
	echo "Fourth parameter must be an existing file";
	exit 4;
fi

if  [[ $5 != *_* ]]; then
	echo "Sixth parameter must like fr_FR, en_EN, ...";
	exit 6;
fi

# Blog URL to connect to
BLOG_URL=$1

# Ghost user that will drop the DB and make the import
USERNAME=$2

# Ghost user's password
PASSWORD=$3

# Zip file containing .md files
EXPORT_FILE=$4

# Ghost DB file
SQLITE3_DB=$5

# 1) Get the credentials
CREDENTIALS=`curl $BLOG_URL/ghost/api/v0.1/authentication/token --data "grant_type=password&username=$USERNAME&password=$PASSWORD&client_id=ghost-admin" -s`
TOKEN_ACCESS=`echo $CREDENTIALS | jq '.access_token' | sed -e 's/\"//g'`
TOKEN_TYPE=`echo $CREDENTIALS | jq '.token_type' | sed -e 's/\"//g'`

#echo "Authorization: $TOKEN_TYPE $TOKEN_ACCESS"
#echo $TOKEN_TYPE
#echo $TOKEN_ACCESS

# 2) Reset all posts
curl $BLOG_URL/ghost/api/v0.1/db/ --request DELETE -H "Authorization: $TOKEN_TYPE $TOKEN_ACCESS" 1>/dev/null -s

# 3) Import posts
curl $BLOG_URL/ghost/api/v0.1/db/ -H "Authorization: $TOKEN_TYPE $TOKEN_ACCESS" -F "importfile=@$EXPORT_FILE" -s 1>/dev/null

#sleep 2
#for post in try;
for post in `cat meta/static.txt`;
do
  slug=`echo $post | sed -e "s/[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]-//g" | sed -e "s/\.md//g"`
  echo "Setting post /$slug as static page..."
  json=`curl $BLOG_URL/ghost/api/v0.1/posts/slug/$slug/ -H "Authorization: $TOKEN_TYPE $TOKEN_ACCESS" -s`
  modified_json=`echo $json | sed -s "s/\"page\":false/\"page\":true/g"`
  post_id=`echo $modified_json | jq ".posts[0] .id"`
  curl $BLOG_URL/ghost/api/v0.1/posts/$post_id/ -H "Authorization: $TOKEN_TYPE $TOKEN_ACCESS" -H "Content-Type: application/json" -s -X PUT -d "$modified_json" 1>/dev/null
done
