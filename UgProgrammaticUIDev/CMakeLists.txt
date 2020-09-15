cmake_minimum_required(VERSION 3.0)
include(ScadeSDK)
if("${SCADESDK_TARGET}" STREQUAL "macos")
    set(use_spm_flag USE_SPM)
else()
    set(use_spm_flag)
endif()
add_scade_application(UgProgrammaticUIDev "com.scade.UgProgrammaticUIDev"
	${use_spm_flag}
	SOURCES
	Sources/UgProgrammaticUIDev/ListControl.page.swift
	Sources/UgProgrammaticUIDev/main.page.swift
	Sources/UgProgrammaticUIDev/HelloWorld.page.swift
	Sources/UgProgrammaticUIDev/DynamicButtonGrid.page.swift
	Sources/UgProgrammaticUIDev/start.swift
	Sources/UgProgrammaticUIDev/FormEntryPage.page.swift
	RESOURCES
		RESOURCES_GROUP "Sources/UgProgrammaticUIDev" NOPREFIX
			ListControl.page
			FormEntryPage.page
			DynamicButtonGrid.page
			main.page
			HelloWorld.page
		RESOURCES_GROUP NOBASE NOPREFIX
			"Resources/check5.svg"
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

set_property(TARGET UgProgrammaticUIDev PROPERTY ANDROID_KEYSTORE_PROPERTIES_FILE "${ANDROID_KEYSTORE_PROPERTIES_FILE}")
set_property(TARGET UgProgrammaticUIDev PROPERTY ANDROID_VERSION_NAME "1.0.0")
set_property(TARGET UgProgrammaticUIDev PROPERTY ANDROID_VERSION_CODE "1")
set_property(TARGET UgProgrammaticUIDev PROPERTY ANDROID_PERMISSIONS "CAMERA")