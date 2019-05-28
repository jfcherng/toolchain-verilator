# Install dependencies script

if [ $ARCH == "linux_x86_64" ]; then
  sudo apt-get install -y build-essential bison flex gperf autoconf
  sudo apt-get autoremove -y
fi

if [ $ARCH == "linux_i686" ]; then
  sudo apt-get install -y build-essential bison flex gperf autoconf \
                          gcc-multilib g++-multilib
  sudo apt-get autoremove -y
fi

if [ $ARCH == "linux_armv7l" ]; then
  sudo apt-get install -y build-essential bison flex gperf autoconf \
                          gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf \
                          binfmt-support qemu-user-static
  sudo apt-get autoremove -y
fi

if [ $ARCH == "linux_aarch64" ]; then
  sudo apt-get install -y build-essential bison flex gperf autoconf \
                          gcc-aarch64-linux-gnu g++-aarch64-linux-gnu \
                          binfmt-support qemu-user-static
  sudo apt-get autoremove -y
fi

if [ ${ARCH:0:7} == "windows" ]; then
  sudo apt-get install -y build-essential bison flex gperf autoconf \
                          mingw-w64 mingw-w64-tools wine
  sudo apt-get autoremove -y
fi

if [ $ARCH == "windows_x86" ]; then
  sudo apt install gcc-mingw-w64-i686 g++-mingw-w64-i686
  sudo apt-get autoremove -y
fi

if [ $ARCH == "windows_amd64" ]; then
  sudo apt install gcc-mingw-w64-x86-64 g++-mingw-w64-x86-64
  sudo apt-get autoremove -y
fi

if [ $ARCH == "darwin" ]; then
  DEPS="bison flex autoconf"
  brew update
  brew install --force $DEPS
  brew unlink $DEPS && brew link --force $DEPS
fi
