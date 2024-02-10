#!/bin/bash
#nile-compile.sh.sh
#Debian Proot - compiling nile
#https://github.com/asb/gogdl
#command line open source version of epic games
echo "Debian Proot - compiling legendary"

pip install requests
git clone https://github.com/Heroic-Games-Launcher/heroic-gogdl
cd heroic-gogdl
./bin/gogdl --help

pip install pyinstaller
pyinstaller --onefile --name gogdl gogdl/cli.py
