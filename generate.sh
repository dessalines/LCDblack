#!/bin/bash

# Generate the face
export COLORS=$(cat templates/snippets/colors.xml)
export PROVIDERS=$(cat templates/snippets/providers.xml)
export TOP_ICON_COMPLICATION=$(cat templates/snippets/top_icon_complication.xml)
export BOTTOM_ICON_COMPLICATION=$(cat templates/snippets/bottom_icon_complication.xml)

cat templates/main.xml | envsubst >app/src/main/res/raw/watchface.xml

# Format the faces and snippets
xmllint -o templates/main.xml --format templates/main.xml
xmllint -o templates/snippets/top_icon_complication.xml --format templates/snippets/top_icon_complication.xml
xmllint -o templates/snippets/bottom_icon_complication.xml --format templates/snippets/bottom_icon_complication.xml

# Remove the inserted first lines also
sed -i '1d' templates/main.xml
sed -i '1d' templates/snippets/top_icon_complication.xml
sed -i '1d' templates/snippets/bottom_icon_complication.xml

xmllint -o app/src/main/res/raw/watchface.xml --format app/src/main/res/raw/watchface.xml
