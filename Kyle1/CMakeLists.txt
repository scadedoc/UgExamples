cmake_minimum_required(VERSION 3.0)
include(ScadeSDK)

add_scade_application(Kyle1 "com.scade.kyle1"
	SOURCES
	/Users/flangel/ScadeM26/Kyle1/src/main.page.swift
	/Users/flangel/ScadeM26/Kyle1/src/start.swift
	/Users/flangel/ScadeM26/Kyle1/src/main.page
	/Users/flangel/ScadeM26/Kyle1/src/ProgrammticUIHelper.swift
	 MACOS_PLIST_PROPERTIES "CFBundleShortVersionString" "1.0" "CFBundleVersion" "1" "NSLocationWhenInUseUsageDescription" "" "NSCameraUsageDescription" "Take pictures from camera" "NSPhotoLibraryUsageDescription" "Choose a photo from your library")
