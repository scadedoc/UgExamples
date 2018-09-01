cmake_minimum_required(VERSION 3.0)
include(ScadeSDK)

scade_add_spm(PACKAGES
	"${CMAKE_CURRENT_BINARY_DIR}/spm/.build/checkouts/SQLite.swift-4128374843722074104")

add_scade_application(UgSqlLiteSwift "com.scade.ugsqlliteswift"
	SOURCES
	src/main.page.swift
	src/start.swift
	RESOURCES
		RESOURCES_GROUP "src" NOPREFIX
			main.page
		RESOURCES_GROUP NOBASE NOPREFIX
			"res/SQLite-feature.png"
			"res/fonts"
			"res/fonts/Arial-BoldMT.ttf"
			"res/sqlite.jpeg"
	LIBRARIES_MACOS SQLite 
	LIBRARIES_IPHONEOS SQLite 
	LIBRARIES_IPHONESIMULATOR SQLite 
	LIBRARIES_ANDROID-X86 SQLite 
	LIBRARIES_ANDROID-ARMEABI-V7A SQLite )
set_property(TARGET UgSqlLiteSwift PROPERTY ANDROID_KEYSTORE_PROPERTIES_FILE "${ANDROID_KEYSTORE_PROPERTIES_FILE}")
set_property(TARGET UgSqlLiteSwift PROPERTY ANDROID_VERSION_NAME "1.0.0")
set_property(TARGET UgSqlLiteSwift PROPERTY ANDROID_VERSION_CODE "1")
