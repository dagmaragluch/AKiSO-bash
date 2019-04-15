#!/bin/bash

url=$(curl -s 'https://api.thecatapi.com/v1/images/search?mime_types=jpg&size=full' | jq -r '.[0].url')

curl -s "$url" > kot

img2txt kot

echo $(curl -s https://api.icndb.com/jokes/random | jq '.value.joke')
