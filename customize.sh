#!/bin/bash
echo '.______    __       __    __   _______     __    __       ___      .______      ____    ____  _______      _______..___________.'
echo '|   _  \  |  |     |  |  |  | |   ____|   |  |  |  |     /   \     |   _  \     \   \  /   / |   ____|    /       ||           |'
echo '|  |_)  | |  |     |  |  |  | |  |__      |  |__|  |    /  ^  \    |  |_)  |     \   \/   /  |  |__      |   (----``---|  |----`'
echo '|   _  <  |  |     |  |  |  | |   __|     |   __   |   /  /_\  \   |      /       \      /   |   __|      \   \        |  |     '
echo '|  |_)  | |  `----.|  `--   | |  |____    |  |  |  |  /  _____  \  |  |\  \----.   \    /    |  |____ .----)   |       |  |     '
echo '|______/  |_______| \______/  |_______|   |__|  |__| /__/     \__\ | _| `._____|    \__/     |_______||_______/        |__|     '
echo
echo 'Welcome developer!'
echo 'Please provide the requested input in order to customize the template for your project.'
echo

echo 'First of all, Please provide your team name.'
echo 'The default is (BlueDev)'
read TEAM_NAME
if [[ -z $TEAM_NAME ]]; then
  TEAM_NAME="BlueDev"
fi
echo "Great Team ${TEAM_NAME}!"
echo

echo 'Please provide your application name.'
echo 'Make sure it'"'"'s all lowercase and separated by dash (\"-\") characters. The default is (node-bedrock)'
read APPLICATION_NAME
if [[ -z $APPLICATION_NAME ]]; then
  APPLICATION_NAME="node-bedrock"
fi
echo "Great, you'll rock building ${APPLICATION_NAME}!"
echo

echo 'Please provide the description of your application.'
echo 'The default is (This is a node bedrock application)'
read APPLICATION_DESCRIPTION
if [[ -z $APPLICATION_DESCRIPTION ]]; then
  APPLICATION_DESCRIPTION="This is a node bedrock application"
fi
echo "Great, ${APPLICATION_DESCRIPTION}!"
echo

echo 'That'"'"'s it! Crazy right? You were in the zone as well!'
echo

echo 'Now please give me a few milliseconds to customize your project...'
echo

# Replace argument $1 by argument $2 in file $3
replace() {
    sed --version >/dev/null 2>&1 || system="isUnix"
    if [[ $system = "isUnix" ]]
    then
        sed -i '' "s/$1/$2/g" $3
    else
        sed -i "s/$1/$2/g" $3
    fi
}

echo '[INFO] Customizing package.json'
replace "BlueDev" "${TEAM_NAME}" "./package.json"
replace "node-bedrock" "${APPLICATION_NAME}" "./package.json"
replace "This is a node bedrock application" "${APPLICATION_DESCRIPTION}" "./package.json"
echo

echo '[INFO] Customizing Constants'
replace "node-bedrock" "${APPLICATION_NAME}" "./src/constants.js"
echo

# Removing package-lock.json from .gitignore file
echo '[INFO] Customizing .gitignore'
replace "package-lock.json" "" "./.gitignore"
# Removing empty lines
sed -i '' "/^$/d" .gitignore
echo

echo '[INFO] Installing dependencies'
npm install
echo

echo 'Done! Enjoy your fresh project, happy developing!'
echo 'And don'"'"'t forget to pull updates regularly from the bedrock!'
