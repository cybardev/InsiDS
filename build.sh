#!/usr/bin/env bash

# >-----< CONFIG >-----< #
EXT="pdf"                # use "pdf" for skin, "png" for testing
RADIUS="39"              # corner radius in pixels
IMG_DIR="./build/assets" # artifact PNG output directory

# make build directory tree
rm -rf ./build
mkdir -p ${IMG_DIR}

# generate masks for rounded corners
ADJ_RAD=$((${RADIUS} * 6 * 414 / 1242)) # corner radius adjusted for mapping size
IMG_RAD=$(bc <<<"${ADJ_RAD} - 0.5")
convert -size $((${ADJ_RAD} * 2))x$((${ADJ_RAD} * 2)) xc:white \
    -fill black -draw "circle ${IMG_RAD},${IMG_RAD} ${IMG_RAD},0" -transparent black \
    ${IMG_DIR}/mask.png
magick ${IMG_DIR}/mask.png -crop 2x2@ +repage +adjoin ${IMG_DIR}/mask_%d.png
mv ${IMG_DIR}/mask_0.png ${IMG_DIR}/mask_save.png
cp ${IMG_DIR}/mask_1.png ${IMG_DIR}/mask_load.png
mv ${IMG_DIR}/mask_1.png ${IMG_DIR}/mask_swap.png
mv ${IMG_DIR}/mask_2.png ${IMG_DIR}/mask_menu.png
mv ${IMG_DIR}/mask_3.png ${IMG_DIR}/mask_fast.png

# generate rounded button PNGs
declare -a BUTTONS=("save" "load" "swap" "menu" "fast")
for BTN in "${BUTTONS[@]}"; do
    case ${BTN} in
    "save")
        GRAVITY="NorthWest"
        BTN_SIZE="486x554"
        ;;
    "load")
        GRAVITY="NorthEast"
        BTN_SIZE="489x348"
        ;;
    "swap")
        GRAVITY="NorthEast"
        BTN_SIZE="489x348"
        ;;
    "menu")
        GRAVITY="SouthWest"
        BTN_SIZE="486x554"
        ;;
    "fast")
        GRAVITY="SouthEast"
        BTN_SIZE="489x348"
        ;;
    *)
        GRAVITY="Center"
        BTN_SIZE="489x348"
        ;;
    esac
    # generate button PNG with centered icon
    magick -size ${BTN_SIZE} xc:none \
        ./assets/${BTN}.png -gravity Center -composite \
        ${IMG_DIR}/${BTN}.png
    # apply corner mask to button
    magick composite \
        ${IMG_DIR}/mask_${BTN}.png ${IMG_DIR}/${BTN}.png \
        -gravity ${GRAVITY} \
        ${IMG_DIR}/${BTN}.png
    # convert pixels: white <-> transparent
    convert ${IMG_DIR}/${BTN}.png \
        -channel a -negate +channel -fill white -colorize 100% \
        ${IMG_DIR}/${BTN}.png
done

# generate PDF skin image for Ignited
magick -size 2688x1242 xc:none \
    ${IMG_DIR}/save.png -gravity NorthWest -geometry +45+45 -composite \
    ${IMG_DIR}/swap.png -gravity NorthEast -geometry +45+45 -composite \
    ${IMG_DIR}/menu.png -gravity SouthWest -geometry +45+45 -composite \
    ${IMG_DIR}/fast.png -gravity SouthEast -geometry +45+45 -composite \
    ./insiDS.${EXT}

# create skin package for Ignited
zip ./build/insiDS.ignitedskin info.json insiDS.${EXT} README.md LICENSE

# move PDF to build directory
mv insiDS.${EXT} ./build/insiDS-ignited.${EXT}

# generate PDF skin image for Delta
magick -size 2688x1242 xc:none \
    ${IMG_DIR}/save.png -gravity NorthWest -geometry +45+45 -composite \
    ${IMG_DIR}/load.png -gravity NorthEast -geometry +45+45 -composite \
    ${IMG_DIR}/menu.png -gravity SouthWest -geometry +45+45 -composite \
    ${IMG_DIR}/fast.png -gravity SouthEast -geometry +45+45 -composite \
    ./insiDS.${EXT}

# create skin packages for Delta
zip ./build/insiDS.deltaskin insiDS.${EXT} README.md LICENSE
cp ./build/insiDS.deltaskin ./build/insiDS-alt.deltaskin
(
    cd delta/main
    zip -ur ../../build/insiDS.deltaskin ./
)
(
    cd delta/alt
    zip -ur ../../build/insiDS-alt.deltaskin ./
)

# move PDF to build directory
mv insiDS.${EXT} ./build/insiDS-delta.${EXT}
