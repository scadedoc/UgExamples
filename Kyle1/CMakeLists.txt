cmake_minimum_required(VERSION 3.0)
include(ScadeSDK)
if(NOT "${SCADESDK_TARGET}" STREQUAL "iphoneos" AND
   NOT "${SCADESDK_TARGET}" STREQUAL "iphonesimulator")
    set(use_spm_flag USE_SPM)
else()
    set(use_spm_flag)
endif()
add_scade_application(Kyle1 "com.scade.Kyle1"
	${use_spm_flag}
	SOURCES
	Sources/Kyle1/Extensions/Pages/main.page.ext.swift
	Sources/Kyle1/main.page.swift
	Sources/Kyle1/ProgrammticUIHelper.swift
	Sources/Kyle1/start.swift
	RESOURCES
		RESOURCES_GROUP "Sources/Kyle1" NOPREFIX
			main.page
		RESOURCES_GROUP NOBASE NOPREFIX

	IOS_EXPORT_METHOD "ad-hoc"
	MACOS_PLIST_PROPERTIES
		"CFBundleShortVersionString" "STRING" "1.0"
		"CFBundleVersion" "STRING" "1"
		"NSLocationWhenInUseUsageDescription" "STRING" ""
		"NSCameraUsageDescription" "STRING" "Take pictures from camera"
		"NSPhotoLibraryUsageDescription" "STRING" "Choose a photo from your library"
		"UIDeviceFamily" ARRAY
			INT "1"
		ARRAY_END
		"UISupportedInterfaceOrientations" ARRAY
			STRING "UIInterfaceOrientationPortrait"
		ARRAY_END
		"UISupportedInterfaceOrientations~ipad" ARRAY
			STRING "UIInterfaceOrientationPortrait"
		ARRAY_END

	MACOS_CERT "${MACOS_CERT}"
	MACOS_PROVISION_PROFILE "${MACOS_PROVISION_PROFILE}")

set_property(TARGET Kyle1 PROPERTY ANDROID_KEYSTORE_PROPERTIES_FILE "${ANDROID_KEYSTORE_PROPERTIES_FILE}")
set_property(TARGET Kyle1 PROPERTY ANDROID_VERSION_NAME "1.0.0")
set_property(TARGET Kyle1 PROPERTY ANDROID_VERSION_CODE "1")
set_property(TARGET Kyle1 PROPERTY ANDROID_PERMISSIONS "CAMERA")