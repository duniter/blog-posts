#!/bin/bash

if  [[ -z $1 ]] ||  [[ -z $2 ]] ||  [[ -z $3 ]] || [[ -z $4 ]]; then
	echo "The script requires 4 parameters";
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

if  [[ $4 != *_* ]]; then
	echo "Fourth parameter must like fr_FR, en_EN, ...";
	exit 4;
fi

# Blog URL to connect to
BLOG_URL=$1

# Ghost user that will drop the DB and make the import
USERNAME=$2

# Ghost user's password
PASSWORD=$3

# Ghost DB file
LANGUAGE=$4

# 1) Get the credentials
CREDENTIALS=`curl $BLOG_URL/ghost/api/v0.1/authentication/token --data "grant_type=password&username=$USERNAME&client_id=ghost-admin" --data-urlencode "password=$PASSWORD" -s -k`
TOKEN_ACCESS=`echo $CREDENTIALS | jq '.access_token' | sed -e 's/\"//g'`
TOKEN_TYPE=`echo $CREDENTIALS | jq '.token_type' | sed -e 's/\"//g'`
editing_content=`cat posts/${LANGUAGE}/disabled/2016-06-29-editing.md`

set_page() {
    local full_file=$1
    local filename=$(basename "${full_file}")

    slug=`echo ${filename} | sed -e "s/[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]-//g" | sed -e "s/\.md//g" | sed -e "s/\./-/g" | awk '{print tolower($0)}'`
    json=`curl ${BLOG_URL}/ghost/api/v0.1/posts/slug/${slug}/ -H "Authorization: $TOKEN_TYPE $TOKEN_ACCESS" -s -k`
    post_id=`echo ${json} | jq ".posts[0] .id"`

    new_markdown=`cat ${full_file} | tail -n +2`
    title=`cat ${full_file} | head -n 1 | tail -c +3`

    local states="published"
    local is_static="false"
    if [[ "${full_file}" == *"static/"* ]]; then
        is_static="true"
        states="$states,static"
    fi

    # Disable article from publishing or unpublishes it
    local published="published"
    if [[ "${full_file}" == *"disabled/"* ]]; then
        published="draft"
    fi

    if [[ "$post_id" = "null" ]]
    then
        if [[ "$published" = "published" ]]
        then
            echo "Creation de l'article : $slug (static=$is_static)"
            json=`jq -n --arg slug "$slug" --arg title "$title" --argjson is_static ${is_static} --arg v "$new_markdown" '{"posts": [{"title": $title,  "markdown": $v, "status": "published", "page": $is_static, "slug": $slug}]}'`
            curl ${BLOG_URL}/ghost/api/v0.1/posts/ -H "Authorization: $TOKEN_TYPE $TOKEN_ACCESS" -H "Content-Type: application/json" -s -k -X POST -d "$json" 1>/dev/null
        else
            echo "Ignore l'article $slug"
        fi
    else
        if [[ "$published" = "draft" ]]
        then
            echo "Mise en attente de l'article $slug"
            json=`jq -n --arg title "$title" --argjson is_static ${is_static} --arg id "$post_id" --arg v "$editing_content" '{"posts": [{"title": $title, "id": $id, "markdown": $v, "status": "published", "page": $is_static }]}'`
        else
            echo "Modification de l'article : $slug ($states)"
            json=`jq -n --arg title "$title" --argjson is_static ${is_static} --arg id "$post_id" --arg v "$new_markdown" '{"posts": [{"title": $title, "id": $id, "markdown": $v, "status": "published", "page": $is_static }]}'`
        fi
        curl ${BLOG_URL}/ghost/api/v0.1/posts/${post_id}/ -H "Authorization: $TOKEN_TYPE $TOKEN_ACCESS" -H "Content-Type: application/json" -s -k -X PUT -d "$json" 1>/dev/null
    fi
}

# Création et mise à jour des articles
#for post in `ls posts/${LANGUAGE}/disabled/*.md`;
for post in `ls posts/${LANGUAGE}/*.md posts/${LANGUAGE}/static/*.md posts/${LANGUAGE}/disabled/*.md`;
do
    set_page ${post}
done

