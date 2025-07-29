#!/bin/bash

export COLORS=$(cat snippets/colors.xml)
export TOP_ICON_COMPLICATION=$(cat snippets/top_icon_complication.xml)
export BOTTOM_ICON_COMPLICATION=$(cat snippets/bottom_icon_complication.xml)

cat main.xml | envsubst >../app/src/main/res/raw/watchface.xml
