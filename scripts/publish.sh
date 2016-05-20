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
CREDENTIALS=`curl $BLOG_URL/ghost/api/v0.1/authentication/token --data "grant_type=password&username=$USERNAME&client_id=ghost-admin" --data-urlencode "password=$PASSWORD" -s -k`
TOKEN_ACCESS=`echo $CREDENTIALS | jq '.access_token' | sed -e 's/\"//g'`
TOKEN_TYPE=`echo $CREDENTIALS | jq '.token_type' | sed -e 's/\"//g'`

# Création et mise à jour des articles
for post in `cat meta/$5.txt`;
do
    slug=`echo $post | sed -e "s/[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]-//g" | sed -e "s/\.md//g" | awk '{print tolower($0)}'`
    json=`curl $BLOG_URL/ghost/api/v0.1/posts/slug/$slug/ -H "Authorization: $TOKEN_TYPE $TOKEN_ACCESS" -s -k`
    post_id=`echo $json | jq ".posts[0] .id"`

    new_markdown=`cat export/$5/published-$post | tail -n +2`
    title=`cat export/$5/published-$post | head -n 1 | tail -c +3`

    if (("$post_id" > 0))
    then
        echo "Modification de l'article : $slug"
        json=`jq -n --arg title "$title" --arg id "$post_id" --arg v "$new_markdown" '{"posts": [{"title": $title, "id": $id, "markdown": $v}]}'`
        curl $BLOG_URL/ghost/api/v0.1/posts/$post_id/ -H "Authorization: $TOKEN_TYPE $TOKEN_ACCESS" -H "Content-Type: application/json" -s -k -X PUT -d "$json" 1>/dev/null
    else
        echo "Création de l'article : $slug"
        json=`jq -n --arg slug "$slug" --arg title "$title" --arg v "$new_markdown" '{"posts": [{"title": $title,  "markdown": $v, "status":"published", "slug": $slug}]}'`
        curl $BLOG_URL/ghost/api/v0.1/posts/ -H "Authorization: $TOKEN_TYPE $TOKEN_ACCESS" -H "Content-Type: application/json" -s -k -X POST -d "$json" 1>/dev/null
    fi
done

# Création et mise à jour des pages statiques
for post in `cat meta/static.txt`;
do
    slug=`echo $post | sed -e "s/[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]-//g" | sed -e "s/\.md//g" | awk '{print tolower($0)}'`
    json=`curl $BLOG_URL/ghost/api/v0.1/posts/slug/$slug/ -H "Authorization: $TOKEN_TYPE $TOKEN_ACCESS" -s -k`

    post_id=`echo $json | jq ".posts[0] .id"`
    new_markdown=`cat export/$5/published-$post | tail -n +2`
    title=`cat export/$5/published-$post | head -n 1 | tail -c +3`

    if (("$post_id" > 0))
    then
        echo "Modification de la page statique : $slug"
        json=`jq -n --arg title "$title" --arg id "$post_id" --arg v "$new_markdown" '{"posts": [{"title": $title, "id": $id, "markdown": $v}]}'`
        curl $BLOG_URL/ghost/api/v0.1/posts/$post_id/ -H "Authorization: $TOKEN_TYPE $TOKEN_ACCESS" -H "Content-Type: application/json" -s -k -X PUT -d "$json" 1>/dev/null
    # else
    #     echo "Création de la page statique : $slug"
    #     json=`jq -n --arg slug "$slug" --arg title "$title" --arg v "$new_markdown" '{"posts": [{"title": $title,  "markdown": $v, "status": "published", "page": true, "slug": $slug}]}'`
    #     curl $BLOG_URL/ghost/api/v0.1/posts/ -H "Authorization: $TOKEN_TYPE $TOKEN_ACCESS" -H "Content-Type: application/json" -s -k -X POST -d "$json" 1>/dev/null
    fi
done
