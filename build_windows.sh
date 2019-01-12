export PATH=/cygdrive/c/tools/cygwin/bin:$PATH

wget -q -O OpenJDK8_x64_Windows.zip "https://api.adoptopenjdk.net/v2/binary/releases/openjdk8?openjdk_impl=hotspot&os=windows&arch=x64&release=latest&type=jdk"
wget -q -O freetype.zip https://github.com/ubawurinna/freetype-windows-binaries/releases/download/v2.9.1/freetype-2.9.1.zip

JDK_BOOT_DIR="$PWD/$(unzip -Z1 OpenJDK8_x64_Windows.zip | grep 'bin/javac'  | tr '/' '\n' | tail -3 | head -1)"
unzip -q OpenJDK8_x64_Windows.zip
mkdir -p openjdk-build/freetype
mv freetype.zip openjdk-build/freetype/
$(cd openjdk-build/freetype/; unzip -q freetype.zip)

# unset cygwin's gcc preconfigured
unset -v CC
unset -v CXX

FREETYPE_DIR="$PWD/openjdk-build/freetype"

cd ./openjdk-build
export LOG=info
./makejdk-any-platform.sh --branch "${SOURCE_JDK_BRANCH}" --tag "${SOURCE_JDK_TAG}" --jdk-boot-dir "${JDK_BOOT_DIR}" --build-variant dcevm --hswap-agent-download-url ${HSWAP_AGENT_DOWNLOAD_URL} --configure-args "--with-freetype-include=${FREETYPE_DIR}/include --with-freetype-lib=${FREETYPE_DIR}/win64 --with-toolchain-version=2013 --disable-ccache" --target-file-name java8-openjdk-dcevm-${TRAVIS_OS_NAME}.zip jdk8u
