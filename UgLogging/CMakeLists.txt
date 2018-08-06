cmake_minimum_required(VERSION 3.0)
include(ScadeSDK)

add_scade_application(UgLogging "com.scade.uglogging"
	SOURCES
	src/main.page.swift
	src/start.swift
	src/Logging.swift
	RESOURCES
		RESOURCES_GROUP "src" NOPREFIX
			main.page
		RESOURCES_GROUP NOBASE NOPREFIX
			"res/fonts"
			"res/fonts/ArialMT.ttf"
	SEARCH_PATHS_MACOS "ScadeKit"
	SEARCH_PATHS_IPHONEOS "ScadeKit"
	SEARCH_PATHS_IPHONESIMULATOR "ScadeKit"
	SEARCH_PATHS_ANDROID-X86 "ScadeKit"
	SEARCH_PATHS_ANDROID-ARMEABI-V7A "ScadeKit"
	MACOS_PLIST_PROPERTIES "CFBundleShortVersionString" "STRING" "1.0"
		"CFBundleVersion" "STRING" "1"
		"NSLocationWhenInUseUsageDescription" "STRING" ""
		"NSCameraUsageDescription" "STRING" "Take pictures from camera"
		"NSPhotoLibraryUsageDescription" "STRING" "Choose a photo from your library"
		"UIDeviceFamily" ARRAY INT "1" ARRAY_END
		"UISupportedInterfaceOrientations" ARRAY STRING "UIInterfaceOrientationPortrait" ARRAY_END
		"UISupportedInterfaceOrientations~ipad" ARRAY STRING "UIInterfaceOrientationPortrait" ARRAY_END)
