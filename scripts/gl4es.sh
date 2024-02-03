apt install -y git gcc build-essential cmake libx11-dev

cd ~
git clone https://github.com/ptitSeb/gl4es
cd gl4es

mkdir build; cd build; cmake -S ../../gl4es; make install

cd ~
rm -r gl4es
