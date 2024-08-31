#!/bin/bash

echo "Converting .png to .webp"

mkdir -p output/cover output/project output/team

for folder in cover project team .
do
    for file in $folder/*.png
    do
        # Extract the filename without the directory
        filename=$(basename "$file")
        # Convert and save the output in the corresponding output directory
        cp "$file" "output/$folder/$filename"
        cwebp -q 60 "$file" -o "output/$folder/${filename%.*}.webp"
        convert -quality 60 "$file" "output/$folder/${filename%.*}.jpg"
    done
done

echo "Done"