#!/bin/bash

echo "Converting .png to .webp"

for folder in cover project team
do
    for file in $folder/*.png
    do
        cwebp -q 80 $file -o ${file%.*}.webp
    done
done

echo "Done"