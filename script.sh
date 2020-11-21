#!/bin/bash

# script to generate a photo album from all photos

function find_photos() {
    photos=`find . -name "*.png" -type f`
}

find_photos

function create_html() {
    # create index.html
    if [ -n index.html ]
    then
         touch index.html
    fi
    for p in $photos
    do
        # for each photo create an image tag
        echo -n "<img src=\"data:image/png;base64," >> index.html
	# add base64 data to the image tag
        echo $p
        #TODO: resize to thumbnail
        echo -n $(base64 $p) >> index.html
        echo "\">" >> index.html
    done
    #TODO: add pagination

}

create_html
