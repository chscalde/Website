#!/bin/bash

 echo "Updating repository"

if [[ -d ~/Desktop/Website/site ]]
then
    echo "Copying website data."
    cp -R /var/www ~/Desktop/Website/site
else
    echo "Creating Folder"
    mkdir ~/Desktop/Website/site
    cp -R /var/www ~/Desktop/Website/site
fi

if [[ -d ~/Desktop/Website/setings ]]
then
    echo "Copying website settings.."
    cp -R /etc/apache2/sites-enabled ~/Desktop/Website/setings
else
    echo "Creating Folder"
    mkdir ~/Desktop/Website/setings
    cp -R /etc/apache2/sites-enabled ~/Desktop/Website/setings
fi

#Git update
git add setings/ site/ store_server_code.sh
Date=$(date +"%m-%d-%Y-%H-%M")
git commit -m "Server code updated automatically on $Date"
git push
echo "All done, server has been backed up...."
