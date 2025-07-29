#!/bin/bash

# Generate the face
export COLORS=$(cat templates/snippets/colors.xml)
export TOP_ICON_COMPLICATION=$(cat templates/snippets/top_icon_complication.xml)
export BOTTOM_ICON_COMPLICATION=$(cat templates/snippets/bottom_icon_complication.xml)

cat templates/main.xml | envsubst >app/src/main/res/raw/watchface.xml

# Format the face
xmllint -o app/src/main/res/raw/watchface.xml --format app/src/main/res/raw/watchface.xml
