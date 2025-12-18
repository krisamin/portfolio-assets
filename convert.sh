#!/bin/bash

mkdir -p docs/cover docs/project docs/team

for folder in cover project team
do
    for file in original/$folder/*.png
    do
        [ -e "$file" ] || continue

        filename=$(basename "$file")
        name="${filename%.*}"

        cp "$file" "docs/$folder/$filename"
        cwebp -q 60 "$file" -o "docs/$folder/$name.webp"
        convert -quality 60 "$file" "docs/$folder/$name.jpg"
    done
done

echo "Done"
