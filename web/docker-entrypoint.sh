#!/bin/sh
set -e

VITE_APP_BACKEND=$(env | grep VITE_APP_BACKEND= | cut -d'=' -f2-)
VITE_APP_COUNTRY_NAME=$(env | grep VITE_APP_COUNTRY_NAME= | cut -d'=' -f2-)
VITE_APP_REGISTRY_NAME=$(env | grep VITE_APP_REGISTRY_NAME= | cut -d'=' -f2-)
VITE_APP_MAXIMUM_FILE_SIZE=$(env | grep VITE_APP_MAXIMUM_FILE_SIZE= | cut -d'=' -f2-)

if [ -n "$VITE_APP_BACKEND" ]; then
    sed -i "s|http://localhost:3000|$VITE_APP_BACKEND|g" /usr/share/nginx/html/assets/*.js
fi

if [ -n "$VITE_APP_COUNTRY_NAME" ]; then
    sed -i "s|CountryX|$VITE_APP_COUNTRY_NAME|g" /usr/share/nginx/html/assets/*.js
fi

if [ -n "$VITE_APP_REGISTRY_NAME" ]; then
    sed -i "s|CountryXRegistry|$VITE_APP_REGISTRY_NAME|g" /usr/share/nginx/html/assets/*.js
fi

if [ -n "$VITE_APP_MAXIMUM_FILE_SIZE" ]; then
    sed -i "s|5242880|$VITE_APP_MAXIMUM_FILE_SIZE|g" /usr/share/nginx/html/assets/*.js
fi

exec "$@"
