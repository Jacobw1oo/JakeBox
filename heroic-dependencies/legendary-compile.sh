#!/bin/bash
#legendary-compile.sh
#Debian Proot - compiling legendary
#https://github.com/derrod/legendary
#free and open-source Epic Games Launcher alternative
echo "Debian Proot - compiling legendary"


pip install requests
git clone https://github.com/Heroic-Games-Launcher/heroic-gogdl
cd heroic-gogdl
./bin/gogdl --help

pip install pyinstaller
pyinstaller --onefile --name gogdl gogdl/cli.py
