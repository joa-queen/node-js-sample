#!/bin/bash

APP_NAME="node-js-sample"

# Check if PM2 is installed
if ! command -v pm2 >/dev/null 2>&1; then
    echo "PM2 is not installed. Installing PM2..."
    npm install pm2@latest -g
fi

# Check if the application is already running
if pm2 list | grep -q $APP_NAME; then
    echo "Application $APP_NAME is running. Restarting..."
    pm2 restart $APP_NAME
else
    echo "Application $APP_NAME is not running. Starting..."
    pm2 start /path/to/your/app.js --name $APP_NAME
fi

pm2 save

# Display the status of the app
pm2 status $APP_NAME
