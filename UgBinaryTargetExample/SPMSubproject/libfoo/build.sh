ANDROID_NDK=~/Library/Android/sdk/ndk/25.2.9519653

rm -Rf build
mkdir build

mkdir build/foo.xcframework
cp Info.plist build/foo.xcframework


mkdir build/macos-arm64
cd build/macos-arm64
cmake ../.. -DCMAKE_BUILD_TYPE=Release
make
cd ../..
mkdir build/foo.xcframework/macos-arm64
cp -RfP include build/foo.xcframework/macos-arm64/Headers
cp build/macos-arm64/libfoo.dylib build/foo.xcframework/macos-arm64


mkdir build/ios-arm64
cd build/ios-arm64
cmake -DCMAKE_TOOLCHAIN_FILE=../../ios.toolchain.cmake -DIOS_PLATFORM=OS ../.. -DCMAKE_BUILD_TYPE=Release
make
cd ../..
mkdir build/foo.xcframework/ios-arm64
cp -RfP include build/foo.xcframework/ios-arm64/Headers
cp build/ios-arm64/libfoo.dylib build/foo.xcframework/ios-arm64


mkdir build/ios-x86_64-simulator
cd build/ios-x86_64-simulator
cmake -DCMAKE_TOOLCHAIN_FILE=../../ios.toolchain.cmake -DIOS_PLATFORM=SIMULATOR64 ../.. -DCMAKE_BUILD_TYPE=Release
make
cd ../..
mkdir build/foo.xcframework/ios-x86_64-simulator
cp -RfP include build/foo.xcframework/ios-x86_64-simulator/Headers
cp build/ios-x86_64-simulator/libfoo.dylib build/foo.xcframework/ios-x86_64-simulator


mkdir build/android-arm64-v8a
cd build/android-arm64-v8a
cmake -DCMAKE_TOOLCHAIN_FILE=../../android.toolchain.cmake -DANDROID_NDK=${ANDROID_NDK} -DCMAKE_ANDROID_ARCH_ABI=arm64-v8a ../.. -DCMAKE_BUILD_TYPE=Release
make
cd ../..
mkdir build/foo.xcframework/android-arm64-v8a
cp -RfP include build/foo.xcframework/android-arm64-v8a/Headers
cp build/android-arm64-v8a/libfoo.so build/foo.xcframework/android-arm64-v8a


