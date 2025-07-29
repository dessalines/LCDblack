#!/bin/bash

# Generate the face
pushd templates
./generate_face.sh
popd

# Format the face
xmllint -o app/src/main/res/raw/watchface.xml --format app/src/main/res/raw/watchface.xml
