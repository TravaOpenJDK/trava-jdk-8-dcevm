export PATH=/cygdrive/c/tools/cygwin/bin:$PATH

wget -q -O OpenJDK8_x64_Windows.zip "https://api.adoptopenjdk.net/v2/binary/releases/openjdk8?openjdk_impl=hotspot&os=windows&arch=x64&release=latest&type=jdk"

JDK_BOOT_DIR="$PWD/$(unzip -Z1 OpenJDK8_x64_Windows.zip | grep 'bin/javac'  | tr '/' '\n' | tail -3 | head -1)"
unzip -q OpenJDK8_x64_Windows.zip

# unset cygwin's gcc preconfigured
unset -v CC
unset -v CXX

FREETYPE_DIR="$PWD/openjdk-build/workspace/build/installedfreetype"

cd ./openjdk-build
export LOG=info
./makejdk-any-platform.sh --tag "${SOURCE_JDK_TAG}" --jdk-boot-dir "${JDK_BOOT_DIR}" --configure-args "--with-freetype=${FREETYPE_DIR}" --target-file-name java8-openjdk-dcevm-${TRAVIS_OS_NAME}.zip jdk8u
