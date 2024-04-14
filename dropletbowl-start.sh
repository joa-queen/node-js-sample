#!/bin/bash

APP_NAME="node-js-sample"

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
