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
- `rofi-code-gists`: Search `XDG_DATA_HOME/shell-scripts/code-gists` by default, copy an existing gist to the clipboard, or create a new one in `nvim`
- `rofi-notes`: Quickly open files from `XDG_DATA_HOME/shell-scripts/quick-notes` by default in `nvim`
- `rofi-prompts`: Search `XDG_DATA_HOME/shell-scripts/prompts` by default, copy an existing prompt to the clipboard, or create a new one in `nvim`
- `rofi-vault`: Recursively search markdown files under `~/Documents/Vault` excluding `.library`, and open them in `nvim`
- `rofi-powermenu`: Powermenu selector(Shutdown, Suspend, Logout...)
- `rofi-virtmanager`: Lists available virtual machines to launch
- `vmsfolder`: Create a shared folder between linux host/guest virtual machines

## Uninstall

```bash
./uninstall.sh
```

Removes all symlinks created during installation.

## Configuration

Scripts can load shell-style key-value config from `~/.config/shell-scripts/config`.

Example overrides to keep the current Vault-backed behavior:

```bash
PROMPT_LIBRARY_DIR="$HOME/Documents/Vault/.library/prompts"
CODE_GISTS_DIR="$HOME/Documents/Vault/.library/code-gists"
NOTES_DIR="$HOME/Documents/Vault/.library/quick-notes"
```
