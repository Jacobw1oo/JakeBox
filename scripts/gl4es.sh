apt install -y git gcc build-essential cmake libx11-dev

echo -e "${GREEN}Clone the repo.${WHITE}"
cd ~
git clone https://github.com/ptitSeb/gl4es
cd gl4es

echo -e "${GREEN}Build and install GL4ES.${WHITE}"
mkdir build; cd build; cmake -S ../../gl4es; make install

echo -e "${GREEN}Clean.${WHITE}"
cd ~
rm -r gl4es
