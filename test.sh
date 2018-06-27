#!/bin/bash

echo 'start'
echo $1
echo $2

read -p 'do we need clean first? yes or no?' name
if [ "$name" = "yes" ]; then
    echo 'yes'
fi
