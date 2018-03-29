cmake_minimum_required(VERSION 3.0)
include(ScadeSDK)

add_scade_application(UgGestureDemo "com.scade.uggesturedemo"
	SOURCES
	/Users/flangel/ScadeM26/UgGestureDemo/src/start.swift
	/Users/flangel/ScadeM26/UgGestureDemo/src/main.page.swift
	/Users/flangel/ScadeM26/UgGestureDemo/src/main.page
	"res/fonts"
	"res/fonts/ArialMT.ttf"
	"res/image1.png"
	 MACOS_PLIST_PROPERTIES "CFBundleShortVersionString" "1.0" "CFBundleVersion" "1" "NSLocationWhenInUseUsageDescription" "" "NSCameraUsageDescription" "Take pictures from camera" "NSPhotoLibraryUsageDescription" "Choose a photo from your library")
