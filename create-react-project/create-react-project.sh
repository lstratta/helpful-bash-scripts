#! /usr/bin/bash

# INITIALISE PROGRESSBAR FUNCTION
function ProgressBar {
# Process data
    # At 10% complete
    # (10 * 100 = 1000) / (100 * 100 = 10,000) / 100
    let _progress=(${1}*100/${2}*100)/100
    # echo " $_progress"
    let _done=(${_progress}*4)/10
    # echo " $_done"
    let _left=40-$_done
# Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

# 1.2 Build progressbar strings and print the ProgressBar line
# 1.2.1 Output example:                           
# 1.2.1.1 Progress : [########################################] 100%
printf "\r[${_fill// /#}${_empty// /-}] ${_progress}%% : ${3}"
}

function StatusReport {

    ProgressBar ${1} ${2}
    echo ${3}

    sleep 0.1
}

_END=233

# printf "CURRENT LINE NUMBER $LINENO\n\n"

sleep 0.4

printf "Enter the project name:\n"
read -p "" PROJECTNAME
echo

_NUMBER=$LINENO
ProgressBar ${_NUMBER} ${_END} ${_DESCRIP}
echo "Creating your React app"

sleep 0.2

_NUMBER=$LINENO
ProgressBar ${_NUMBER} ${_END} ${_DESCRIP}
echo "Setting up ReactJS Framework"

create-react-app $PROJECTNAME

cd $PROJECTNAME

sleep 0.1

cd src

_NUMBER=$LINENO
ProgressBar ${_NUMBER} ${_END}
echo "Tidying up the src folder"


sleep 0.1

_NUMBER=$LINENO
ProgressBar ${_NUMBER} ${_END}
echo "Creating src folders"

mkdir css assets components tests utils

sleep 0.1

_NUMBER=$LINENO
ProgressBar ${_NUMBER} ${_END}
echo "Moving files"

mv App.css index.css css && mv App.test.js setupTests.js tests && mv reportWebVitals.js utils && mv logo.svg assets && cd ..

sleep 0.1

_NUMBER=$LINENO
ProgressBar ${_NUMBER} ${_END}
echo "Creating your server"


mkdir server && touch .env && touch server/server.js && mkdir server/router && touch server/router/api.js


sleep 0.1

_NUMBER=$LINENO
ProgressBar ${_NUMBER} ${_END}
# ADDING CODE TO SERVER FILES
echo "Adding code to server files"

sleep 0.1

_NUMBER=$LINENO
ProgressBar ${_NUMBER} ${_END}
echo "INITIALISING .env"

echo "PORT=8080" >> .env
echo "HOST=localhost" >> .env
echo "DB_URI=[DATABASE_URI]" >> .env

sleep 0.1

_NUMBER=$LINENO
ProgressBar ${_NUMBER} ${_END}
echo "INITIALSING server.js"

sleep 0.1

_NUMBER=$LINENO
ProgressBar ${_NUMBER} ${_END}
echo "Adding dependencies"

cd server

# server.js CODE
####################
echo "const express = require('express');" >> server.js
echo "const mongoose = require('mongoose');" >> server.js
echo "const morgan = require('morgan');" >> server.js
echo "const path = require('path');" >> server.js
echo "require('dotenv').config();" >> server.js

echo "" >> server.js

sleep 0.1
_NUMBER=$LINENO
ProgressBar ${_NUMBER} ${_END}
echo "Adding environment variables"

echo "const app = express();" >> server.js
echo "const PORT = process.env.PORT;" >> server.js
echo "const dbURI = process.env.DB_URI" >> server.js

echo "" >> server.js

sleep 0.1
_NUMBER=$LINENO
ProgressBar ${_NUMBER} ${_END}
echo "Setting up routes"

echo "const routes = require('./routes/api');" >> server.js

echo "" >> server.js

sleep 0.1
_NUMBER=$LINENO
ProgressBar ${_NUMBER} ${_END}
echo "Connecting to MongoDB with Mongooose"

echo "const main = async() => {" >> server.js
echo "    await mongoose.connect(dbURI);}" >> server.js

echo "" >> server.js

echo "main().catch(err => console.log(err));" >> server.js

echo "" >> server.js

sleep 0.1
_NUMBER=$LINENO
ProgressBar ${_NUMBER} ${_END}
echo "Setting up ExpressJS"

echo "// Allows the data being sent by the POST" >> server.js 
echo "// request to be read by the server" >> server.js
echo "app.use(express.json());" >> server.js
echo "app.use(express.urlencoded({extended: false}));" >> server.js

echo "" >> server.js

sleep 0.1
_NUMBER=$LINENO
ProgressBar ${_NUMBER} ${_END}
echo "Setting up Morgan"

echo "// HTTP request logger" >> server.js
echo "app.use(morgan('tiny'));" >> server.js

echo "" >> server.js

sleep 0.1
_NUMBER=$LINENO
ProgressBar ${_NUMBER} ${_END}
echo "Setting up api.js route"

echo "app.use('/api', routes);" >> server.js

echo "" >> server.js

sleep 0.1
_NUMBER=$LINENO
ProgressBar ${_NUMBER} ${_END}
echo "Setting up port listener"

echo "app.listen(PORT, console.log('Server is listening on PORT: ', PORT));" >> server.js

####################

# cd back into root project folder and then into src
cd ../src

# Update files with correct import paths
####################

StatusReport $LINENO ${_END} "Updating paths in App.js"

sed -i "s/.\/App.css/.\/css\/App.js/1" App.js

StatusReport $LINENO ${_END} "Updating paths in index.js"

sed -i "s/.\/index.css/.\/css\/index.js/1" index.js

###################

sleep 1

_NUMBER=$LINENO
ProgressBar ${_NUMBER} ${_END}
echo "Installing dependencies to package.json"
echo

npm i axios concurrently cors dotenv express mongoose morgan
echo

sleep 1

_NUMBER=$LINENO
ProgressBar ${_NUMBER} ${_END}
echo "PROJECT SETUP COMPLETE"
echo

sleep 1


