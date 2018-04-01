cmake_minimum_required(VERSION 3.0)
include(ScadeSDK)

add_scade_application(UgProgrammaticUIDev "com.scade.ugprogrammaticuidev"
	SOURCES
	/Users/flangel/Dropbox/Projects/UgExamples/UgProgrammaticUIDev/src/FormEntryPage.page.swift
	/Users/flangel/Dropbox/Projects/UgExamples/UgProgrammaticUIDev/src/HelloWorld.page.swift
	/Users/flangel/Dropbox/Projects/UgExamples/UgProgrammaticUIDev/src/ListControl.page.swift
	/Users/flangel/Dropbox/Projects/UgExamples/UgProgrammaticUIDev/src/main.page.swift
	/Users/flangel/Dropbox/Projects/UgExamples/UgProgrammaticUIDev/src/start.swift
	/Users/flangel/Dropbox/Projects/UgExamples/UgProgrammaticUIDev/src/FormEntryPage.page
	/Users/flangel/Dropbox/Projects/UgExamples/UgProgrammaticUIDev/src/HelloWorld.page
	/Users/flangel/Dropbox/Projects/UgExamples/UgProgrammaticUIDev/src/ListControl.page
	/Users/flangel/Dropbox/Projects/UgExamples/UgProgrammaticUIDev/src/main.page
	/Users/flangel/Dropbox/Projects/UgExamples/UgProgrammaticUIDev/src/DynamicButtonGrid.page.swift
	/Users/flangel/Dropbox/Projects/UgExamples/UgProgrammaticUIDev/src/DynamicButtonGrid.page
	"res/check5.svg"
	 MACOS_PLIST_PROPERTIES "CFBundleName" "UgProgrammaticUIDev" "CFBundleIdentifier" "com.scade.UgProgrammaticUIDev" "CFBundleShortVersionString" "1.0" "CFBundleVersion" "1" "NSLocationWhenInUseUsageDescription" "" "NSCameraUsageDescription" "Take pictures from camera" "NSPhotoLibraryUsageDescription" "Choose a photo from your library")
