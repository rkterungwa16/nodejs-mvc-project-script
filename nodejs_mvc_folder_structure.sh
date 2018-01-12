#!/bin/sh

#
# SCRIPT: nodejs_mvc_folder_structure.sh
# AUTHOR: Richard Terungwa Kombol
# DATE: January 12 2018
#
# PURPOSE: This script is used to automate the creation of
#          a typical nodejs mvc project on the command line
#

echo "Create Directory for your node.js application"

read APP_DIR_NAME

mkdir $APP_DIR_NAME

cd $APP_DIR_NAME

mkdir "View"

mkdir "Routes"

mkdir "Controllers"

echo "Create entry point for your application"

read APP_ENTRY_POINT_NAME

if [[ $APP_ENTRY_POINT_NAME =~ [.js]{1}$ ]]; then
  echo "App directory will now be created"
  APP_NAME=$APP_ENTRY_POINT_NAME
else
  APP_NAME="${APP_ENTRY_POINT_NAME}.js"
fi

touch $APP_NAME

cd "View"

touch "index.html"

cd ..

cd "Routes"

touch "index.js"

cd ..

cd "Controllers"

touch "index.js"

cd ..

touch "package.json"

touch "app_dir_list.txt"

echo "{
  \"version\": \"0.0.0\",
  \"author\": \"terungwa\",
  \"name\": \"$APP_DIR_NAME\",
  \"scripts\": {
    \"start\": \"node $APP_ENTRY_POINT_NAME\"
  }
}" >> "package.json"

echo "These are the contents for newly created directory"

ls

ls > "app_dir_list.txt"

value=ls | grep "data.txt"

if [[ $value ]]; then
  echo "It exists"
else
  echo "It does not exist"
fi
