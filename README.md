# insiDS

## DS Controller Skin for Ignited Emulator

Minimalistic DS skin for use with controllers like the Razer Kishi V2

> [!IMPORTANT]
> Intended for use with edge-to-edge devices. May not work with devices that have a home button.

### Guide

- [Screenshots](<#screenshots>)

- [Features](<#features>)

- [Usage](<#usage>)

- [Modification](<#modification>)

  - [Steps](<#steps>)

  - [Alternate Steps](<#alternate-steps>)

- [Credits](<#credits>)

### Screenshots

![Screenshot of the insiDS skin for Ignited emulator playing Tales of Innocence using a Razer Kishi V2 controller](<./screenshots/insiDS-toi.png> "insiDS skin for Ignited showing Tales of Innocence")

![Screenshot of the insiDS skin for Ignited emulator playing Pokemon Platinum using a Razer Kishi V2 controller](<./screenshots/insiDS-plat.png> "insiDS skin for Ignited showing Pokemon Platinum")

### Features

- Main screen in focus, centered horizontally

- Secondary screen minified but accessible

- Swap screens with the push of a button

- Pause Menu, Quick Save, and Fast Forward buttons for easy access

### Usage

- Download latest release from this link: <https://github.com/cybardev/InsiDS/releases/download/latest/insiDS.ignitedskin>
- Tap the downloaded file, or import manually in Ignited settings

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
  ```

  - **PS**: change `0.16` above to whatever button opacity you want between 0.0 to 1.0 (1.0 is fully opaque, 0.0 is fully transparent)

- Install generated `insiDS.ignitedskin` file in Ignited

#### Alternate Steps

- Fork this repository and clone your fork

- Edit XCF files in [src](<./src>) and export to [assets](<./assets>) as PNG

- Push changes to your fork

- Run GitHub Actions workflow (_if it doesn't run automatically_)

- Download `insiDS.ignitedskin` from releases and install in Ignited

> [!NOTE]
> The [Steps](<#steps>) section is good for one-time changes. Follow [Alternate Steps](<#alternate-steps>) to maintain a history of your changes.

### Credits

- [noah978's skin guide](<https://noah978.gitbook.io/delta-docs/skins>)

- [nazy00](<https://github.com/nazy00>) for button icons

- [keewhi](<https://github.com/keewhi>) for inspiration

- [GIMP](<https://www.gimp.org>) for button creation

- [mockuphone.com](<https://mockuphone.com/device/apple-iphone13mini-midnight>) for mockups
