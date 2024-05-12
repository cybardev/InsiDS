#!/usr/bin/env bash

# make build directory tree
mkdir -p build/assets

# generate rounded button PNGs
declare -a BUTTONS=("save" "menu" "swap" "load" "fast")
for BTN in "${BUTTONS[@]}"; do
    convert ./assets/buttons/${BTN}.png \
        -channel a -negate +channel -fill white -colorize 100% ./build/assets/${BTN}.png
    magick ./build/assets/${BTN}.png ./assets/masks/${BTN}.png \
        -compose ChangeMask -composite ./build/assets/${BTN}.png
done

# generate PDF skin image for Ignited
magick -size 2688x1242 xc:none \
    ./build/assets/save.png -geometry +45+45 -composite \
    ./build/assets/menu.png -geometry +45+643 -composite \
    ./build/assets/swap.png -geometry +2155+45 -composite \
    ./build/assets/fast.png -geometry +2155+849 -composite \
    ./insiDS.pdf

# create skin package for Ignited
zip ./build/insiDS.ignitedskin info.json insiDS.pdf README.md LICENSE

# generate PDF skin image for Delta
magick -size 2688x1242 xc:none \
    ./build/assets/save.png -geometry +45+45 -composite \
    ./build/assets/menu.png -geometry +45+643 -composite \
    ./build/assets/load.png -geometry +2155+45 -composite \
    ./build/assets/fast.png -geometry +2155+849 -composite \
    ./insiDS.pdf

# create skin packages for Delta
zip ./build/insiDS.deltaskin insiDS.pdf README.md LICENSE
cp ./build/insiDS.deltaskin ./build/insiDS-alt.deltaskin
(
    cd delta/main
    zip -ur ../../build/insiDS.deltaskin ./
)
(
    cd delta/alt
    zip -ur ../../build/insiDS-alt.deltaskin ./
)
