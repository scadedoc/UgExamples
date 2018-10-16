cmake_minimum_required(VERSION 3.0)
include(ScadeSDK)

add_scade_application(UgSwiftFoundationDemo "com.scade.ugswiftfoundationdemo"
	SOURCES
	src/DateDemo.swift
	src/HttpClientSample.swift
	src/TestResult.swift
	src/main.page.swift
	src/start.swift
	RESOURCES
		RESOURCES_GROUP "src" NOPREFIX
			main.page
		RESOURCES_GROUP NOBASE NOPREFIX
			"res/fonts"
			"res/fonts/Arial-BoldMT.ttf"
			"res/fonts/ArialMT.ttf"
	SEARCH_PATHS_MACOS "workspace:/.metadata/.plugins/com.scade.sdk.phoenix/ScadeSDK/bin/macos/PhoenixSimulator.app/Contents/Resources"
	LIBRARIES_MACOS ScadeKit.framework
	SEARCH_PATHS_IPHONEOS "workspace:/.metadata/.plugins/com.scade.sdk.phoenix/ScadeSDK/lib/iphoneos"
	LIBRARIES_IPHONEOS ScadeKit.framework
	SEARCH_PATHS_IPHONESIMULATOR "workspace:/.metadata/.plugins/com.scade.sdk.phoenix/ScadeSDK/lib/iphonesimulator"
	LIBRARIES_IPHONESIMULATOR ScadeKit.framework
	MACOS_PLIST_PROPERTIES "CFBundleShortVersionString" "STRING" "1.0"
		"CFBundleVersion" "STRING" "1"
		"NSLocationWhenInUseUsageDescription" "STRING" ""
		"NSCameraUsageDescription" "STRING" "Take pictures from camera"
		"NSPhotoLibraryUsageDescription" "STRING" "Choose a photo from your library"
		"UIDeviceFamily" ARRAY INT "1" ARRAY_END
		"UISupportedInterfaceOrientations" ARRAY STRING "UIInterfaceOrientationPortrait" ARRAY_END)
