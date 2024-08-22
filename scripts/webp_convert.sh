#!/bin/sh
## First of all you should install webp lib, for example via `brew install webp`
cd .. &&
cd assets/images &&
for file in **/*.png
  do
    cwebp -q 100 "$file" -o "${file%.png}.webp" || true &&
    rm $file || true
done
for file in *.png
  do
    cwebp -q 100 "$file" -o "${file%.png}.webp" || true &&
    rm $file || true
done