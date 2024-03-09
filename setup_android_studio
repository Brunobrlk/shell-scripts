#!/bin/bash

# Create "Android" folder if doesn't exist
mkdir -p ~/Android

# Iterate through all .tar.gz files in the current folder
for file in *.tar.gz; do
  # Extract the .tar.gz file to Android folder
  tar -zxvf "$file" -C $HOME/Android

  SED_CUT_VERSION='s/\(.*\)-.*2.*$/\1/'  
  SED_MINUS_TO_SPACES='s/-/ /g'
  SED_CAPITALIZE='s/\b\(.\)/\u\1/g'

  DIR=$(echo "$file%.tar.gz" | sed -e "$SED_CUT_VERSION")
  NAME=$(echo "$DIR" | sed -e "$SED_MINUS_TO_SPACES" -e "$SED_CAPITALIZE")
  echo $DIR
  mv $HOME/Android/android-studio "$HOME/Android/$DIR"
  cat <<EOF > "$HOME/Desktop/$DIR.desktop"
  [Desktop Entry]
  Version=1.0
  Type=Application
  Name=Android Studio
  Icon=$HOME/Android/$DIR/bin/studio.svg
  Exec="$HOME/Android/$DIR/bin/studio.sh" %f
  Comment=The Drive to Develop
  Categories=Development;IDE;
  Terminal=false
  StartupWMClass=jetbrains-studio
  StartupNotify=true
  Name[en_US]=$NAME
EOF
done
chmod 755 $HOME/Desktop/android-studio-*

# Add emulators to your environment
cp -r avd $HOME/.android/
