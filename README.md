# Personal Automation Scripts

A collection of shell scripts for daily automation, Android development, and system maintenance.

## Installation

```bash
./install.sh
```

This will symlink all scripts in `bin/` to `~/.local/bin/`.

## Scripts

> droid-* = Android automations
>
> rofi-* = Uses rofi as menu selector

- `buildc`: Compile and execute a c program
- `droid-appclass`: Create application class and declare into Manifest
- `droid-gen-mappers`: Create mappers from domain/models. ie: Person(Domain) -> PersonDto(Network) and PersonEntity(Database)
- `droid-mkapp`: Build MVVM structure, add common resources, files. Android project quick-start template
- `droid-vb`: Add viewbinding to app/build.gradle
- `generate-debug-symbols`: Automatically generate android native debug symbols for PlayStore
- `mint-clean`: Delete cache, logging, and other stuff
- `random-wallpaper`: Change wallpaper using fed
- `rofi-avdman`: Lists available android emulators to launch
- `rofi-bookmarks`: Lists bookmarks and launch the choice into browser
- `rofi-cheatsheet`: Lists cheatsheets and launch the choice into default editor
- `rofi-clipboard`: Lists your clipboard history via greenclip
- `rofi-docker`: Lists available containers to launch
- `rofi-droid-deps`: Add dependencies to apps via gradle(versions.toml)
- `rofi-droid-perms`: Add boilerplate code for adding permissions to apps
- `rofi-launcher`: Default customized rofi launcher for system menu
- `rofi-mpd`: MPD controller(Play/Pause, Stop, Next, Prev)
- `rofi-note`: Quickly open notes stored in `XDG_DATA_HOME/shell-scripts/notes` by default and edit them in `nvim`
- `rofi-powermenu`: Powermenu selector(Shutdown, Suspend, Logout...)
- `rofi-virtmanager`: Lists available virtual machines to launch
- `vmsfolder`: Create a shared folder between linux host/guest virtual machines

## Uninstall

```bash
./uninstall.sh
```

Removes all symlinks created during installation.

## Configuration

Scripts can load shell-style key-value config files from:

- `~/.config/shell-scripts/config`

Example override for `rofi-note`:

```bash
ROFI_NOTE_DIR="$HOME/Documents/notes"
```
