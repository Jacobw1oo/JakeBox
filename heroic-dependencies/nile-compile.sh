#!/bin/bash
#nile-compile.sh.sh
#Debian Proot - compiling nile
#https://github.com/derrod/legendary
#command line open source version of epic games
echo "Debian Proot - compiling legendary"

sudo apt install python3-pycryptodome python3-requests python3-zstandard python3-protobuf python3-json5
pip install pyinstaller
git clone https://github.com/imLinguin/nile
cd nile
python3 -m venv env
pyinstaller --onefile --name nile nile/cli.py
