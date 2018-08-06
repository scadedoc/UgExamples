cmake_minimum_required(VERSION 3.0)
include(ScadeSDK)

add_scade_application(UgCryptoSwift "com.scade.ugcryptoswift"
	SOURCES
	src/main.page.swift
	src/start.swift
	RESOURCES
		RESOURCES_GROUP "src" NOPREFIX
			main.page
		RESOURCES_GROUP NOBASE NOPREFIX
			"res/fonts"
			"res/fonts/ArialMT.ttf"
	LIBRARIES_MACOS CryptoSwift 
	LIBRARIES_IPHONEOS CryptoSwift 
	LIBRARIES_IPHONESIMULATOR CryptoSwift 
	LIBRARIES_ANDROID-X86 CryptoSwift 
	LIBRARIES_ANDROID-ARMEABI-V7A CryptoSwift 
	MACOS_PLIST_PROPERTIES "CFBundleShortVersionString" "STRING" "1.0"
		"CFBundleVersion" "STRING" "1"
		"NSLocationWhenInUseUsageDescription" "STRING" ""
		"NSCameraUsageDescription" "STRING" "Take pictures from camera"
		"NSPhotoLibraryUsageDescription" "STRING" "Choose a photo from your library"
		"UIDeviceFamily" ARRAY INT "1" ARRAY_END
		"UISupportedInterfaceOrientations" ARRAY STRING "UIInterfaceOrientationPortrait" ARRAY_END
		"UISupportedInterfaceOrientations~ipad" ARRAY STRING "UIInterfaceOrientationPortrait" ARRAY_END)

swift_add_spm("/Users/flangel/Dropbox/Projects/UgExamples/UgCryptoSwift/.build/scade-simulator/spm/.build/checkouts/CryptoSwift--5560562967812595289")