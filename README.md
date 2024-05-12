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

**Dependencies**: `imagemagick >= 7.1`

#### Steps

- Clone this repository or download the ZIP and extract to a folder

- Edit PNG files in [assets](<./assets/>)
  - to change icons, edit files in [assets/buttons](<./assets/buttons/>)
  - to change corners, edit files in [assets/masks](<./assets/masks/>)

- Run [`build.sh`](<./build.sh>) at the repository root (folder with `info.json`)

- Check the generated `build` directory

- Install generated `.ignitedskin` file in Ignited, and `.deltaskin` files in Delta

#### Alternate Steps

- Fork this repository and clone your fork

- Edit PNG files in [assets](<./assets/>)
  - to change icons, edit files in [assets/buttons](<./assets/buttons/>)
  - to change corners, edit files in [assets/masks](<./assets/masks/>)

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
