
include(AddAndroidApp)

set(libs_list)
set(assets)

set(java_sources
    "org/swift/testfoundation/Application.java"
    "org/swift/testfoundation/MainActivity.java")

add_library(TestFoundationJNI SHARED "org_swift_testfoundation_MainActivity.cpp")
set_property(TARGET TestFoundationJNI PROPERTY CXX_STANDARD 14)
target_link_libraries(TestFoundationJNI TestFoundation android log)

set(libs_list
    "${CMAKE_CURRENT_BINARY_DIR}/libTestFoundationJNI.so"
    "${CMAKE_CURRENT_BINARY_DIR}/../libTestFoundation.so"
    "${CMAKE_CURRENT_BINARY_DIR}/../../../SwiftXCTest/libswiftSwiftXCTest.so"
    "${CMAKE_CURRENT_BINARY_DIR}/../../../Foundation/libswiftFoundation.so"
    "${CMAKE_CURRENT_BINARY_DIR}/../../Foundation/libswiftSwiftFoundation.so"
    "${CMAKE_CURRENT_BINARY_DIR}/../../../swift-jni/libswiftJNI.so"
    "${CMAKE_CURRENT_BINARY_DIR}/../../../ObjectiveC/libswiftObjectiveC.so"
    "${CMAKE_CURRENT_BINARY_DIR}/../../../platform/libswiftGlibc.so"
    "${CMAKE_CURRENT_BINARY_DIR}/../../../SwiftOnoneSupport/libswiftSwiftOnoneSupport.so"
    "${CMAKE_CURRENT_BINARY_DIR}/../../../core/libswiftCore.so"
    "${CMAKE_CURRENT_BINARY_DIR}/../../../scade-foundation/libFoundation.so"
    "${CMAKE_CURRENT_BINARY_DIR}/../../../libdispatch/src/libdispatch.so"
    "${CMAKE_CURRENT_BINARY_DIR}/../../../icu/libscadeicu.so"
    "${CMAKE_CURRENT_BINARY_DIR}/../../../uuid/libuuid.so"
    "${CMAKE_CURRENT_BINARY_DIR}/../../../libxml2/libxml2.so"
    "${CMAKE_CURRENT_BINARY_DIR}/../../../objc/libobjc.so"
    )

set(jars
    "${CMAKE_CURRENT_BINARY_DIR}/../../AndroidFoundation/SwiftFoundation.jar")


# add resource files into assets
set(res_dir "${CMAKE_CURRENT_SOURCE_DIR}/../Resources")
file(GLOB_RECURSE resources RELATIVE "${res_dir}" "${res_dir}/*")
add_android_app_assets(assets "${res_dir}" "<noprefix>" ${resources})

add_android_app(TestFoundation-Android
                "org.swift.testfoundation"
                "org.swift.testfoundation.Application"
                "org.swift.testfoundation.MainActivity"
                assets
                JAVA_SOURCES_BASE "${CMAKE_CURRENT_SOURCE_DIR}/src"
                JAVA_SOURCES ${java_sources}
                JARS ${jars}
                LIBRARIES ${libs_list}
                COPY_STL
                DEBUG)

# TODO: try avoid dependency on internal add_android_app targets
add_dependencies(TestFoundation-Android-copy TestFoundationJNI)

add_dependencies(TestFoundation-Android TestFoundationJNI TestFoundation)

if(SWIFT_OBJC_INTEROP)
add_dependencies(TestFoundation-Android-copy swiftFoundation)
endif()

