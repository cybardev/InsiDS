# insiDS

## DS Controller Skin for Ignited and Delta emulators

Minimalistic DS skin for use with controllers like the Razer Kishi V2

> [!IMPORTANT]
> Intended for use with edge-to-edge devices. May not work with devices that have a home button.

### Guide

- [Screenshots](<#screenshots>)

- [Features](<#features>)

- [Using with Ignited](<#using-with-ignited>)

- [Using with Delta](<#using-with-delta>)

- [Modification](<#modification>)

  - [Steps](<#steps>)

  - [Alternate Steps](<#alternate-steps>)

- [Credits](<#credits>)

### Screenshots

![Screenshot of the insiDS skin playing Tales of Innocence using a Razer Kishi V2 controller](<./screenshots/insiDS-toi.png> "insiDS skin showing Tales of Innocence")
*Tales of Innocence*

![Screenshot of the insiDS skin playing Pokemon Platinum using a Razer Kishi V2 controller](<./screenshots/insiDS-plat.png> "insiDS skin showing Pokemon Platinum")
*Pokemon Platinum*

### Features

- Main screen in focus, centered horizontally

- Secondary screen minified but accessible

- Swap screens with the push of a button (*Ignited only*)

- Pause Menu, Quick Save, Quick Load (*Delta only*), and Fast Forward buttons for easy access

### Using with Ignited

- Download latest release from this link: <https://github.com/cybardev/InsiDS/releases/download/latest/insiDS.ignitedskin>

- Tap the downloaded file, or import manually in Ignited settings

### Using with Delta

- Download latest release from these links:

  - main screen centred: <https://github.com/cybardev/InsiDS/releases/download/latest/insiDS.deltaskin>

  - touch screen centred: <https://github.com/cybardev/InsiDS/releases/download/latest/insiDS-alt.deltaskin>

- Tap the downloaded files, or import manually in Delta settings

- Screen swap button will not work (until Delta implements it). Switch to and from alt skin from Delta settings

### Modification

> [!IMPORTANT]
> Tested on macOS only. Likely to work on Linux. Windows users can use WSL if needed.

**Dependencies**: `GIMP >= 2.10`, `imagemagick >= 7.1`

#### Steps

- Clone this repository or download the ZIP and extract to a folder

- Edit XCF files in [src](<./src>) and export to [assets](<./assets>) as PNG

- Run the following commands in the repository root (folder with `info.json`):

  ```sh
  magick -size 2688x1242 xc:none \
    ./assets/save.png  -geometry    +45+45  -composite \
    ./assets/menu.png  -geometry   +45+643  -composite \
    ./assets/swap.png  -geometry  +2155+45  -composite \
    ./assets/fast.png  -geometry +2155+849  -composite \
    -alpha set -background none -channel A -evaluate multiply 0.16 +channel \
    insiDS.pdf

  zip insiDS.ignitedskin info.json insiDS.pdf README.md LICENSE
  zip insiDS.deltaskin insiDS.pdf README.md LICENSE
  cp insiDS.deltaskin insiDS-alt.deltaskin
  (cd delta/main; zip -ur ../../insiDS.deltaskin ./)
  (cd delta/alt; zip -ur ../../insiDS-alt.deltaskin ./)
  ```

  - **PS**: change `0.16` above to whatever button opacity you want between 0.0 to 1.0 (1.0 is fully opaque, 0.0 is fully transparent)

- Install generated `.ignitedskin` file in Ignited, and `.deltaskin` files in Delta

#### Alternate Steps

- Fork this repository and clone your fork

- Edit XCF files in [src](<./src>) and export to [assets](<./assets>) as PNG

- Push changes to your fork

- Run GitHub Actions workflow (*if it doesn't run automatically*)

- From releases, download and install generated `.ignitedskin` file in Ignited, and `.deltaskin` files in Delta

> [!NOTE]
> The [Steps](<#steps>) section is good for one-time changes. Follow [Alternate Steps](<#alternate-steps>) to maintain a history of your changes.

### Credits

- [noah978's skin guide](<https://noah978.gitbook.io/delta-docs/skins>)

- [nazy00](<https://github.com/nazy00>) for button icons

- [keewhi](<https://github.com/keewhi>) for inspiration

- [GIMP](<https://www.gimp.org>) for button creation

- [mockuphone.com](<https://mockuphone.com/device/apple-iphone13mini-midnight>) for mockups
