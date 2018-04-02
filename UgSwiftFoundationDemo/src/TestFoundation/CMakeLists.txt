

include(Swift)

set(sources
    HTTPServer.swift
    main.swift
    TestAffineTransform.swift
    TestBundle.swift
    TestByteCountFormatter.swift
    TestCalendar.swift
    TestCharacterSet.swift
    TestCodable.swift
    TestDateFormatter.swift
    TestDate.swift
    TestDecimal.swift
    TestEnergyFormatter.swift
    TestFileHandle.swift
    TestFileManager.swift
#    TestHTTPCookieStorage.swift
#    TestHTTPCookie.swift
    TestIndexPath.swift
    TestIndexSet.swift
    TestISO8601DateFormatter.swift
    TestJSONEncoder.swift
    TestJSONSerialization.swift
    TestLengthFormatter.swift
    TestMassFormatter.swift
    TestNotificationCenter.swift
    TestNotificationQueue.swift
    TestNotification.swift
    TestNSArray.swift
    TestNSAttributedString.swift
    TestNSCache.swift
    TestNSCompoundPredicate.swift
    TestNSData.swift
    TestNSDictionary.swift
    TestNSError.swift
    TestNSGeometry.swift
    TestNSKeyedArchiver.swift
    TestNSKeyedUnarchiver.swift
    TestNSLocale.swift
    TestNSNull.swift
    TestNSNumber.swift
    TestNSOrderedSet.swift
    TestNSPredicate.swift
    TestNSProgressFraction.swift
    TestNSRange.swift
    TestNSRegularExpression.swift
    TestNSSet.swift
    TestNSString.swift
    TestNSTextCheckingResult.swift
    TestNSURLRequest.swift
    TestNSUUID.swift
    TestNSValue.swift
    TestNumberFormatter.swift
    TestObjCRuntime.swift
    TestOperationQueue.swift
    TestPersonNameComponents.swift
    TestPipe.swift
    TestProcessInfo.swift
    TestProcess.swift
    TestProgress.swift
    TestPropertyListSerialization.swift
    TestRunLoop.swift
    TestScanner.swift
    TestStream.swift
    TestThread.swift
    TestTimer.swift
    TestTimeZone.swift
    TestUnitConverter.swift
    TestURLCredential.swift
    TestURLProtocol.swift
    TestURLRequest.swift
    TestURLResponse.swift
    TestURLSession.swift
    TestURL.swift
    TestUserDefaults.swift
    TestUtils.swift
    TestXMLDocument.swift
    TestXMLParser.swift
#    XDGTestHelper.swift
   )

set(real_sources)
foreach(src ${sources})
    list(APPEND real_sources "${CMAKE_CURRENT_SOURCE_DIR}/${src}")
endforeach()

list(APPEND SWIFT_INCLUDE_DIRS "${CMAKE_CURRENT_BINARY_DIR}/../Foundation")

if(SWIFT_OBJC_INTEROP)
    list(APPEND SWIFT_FLAGS "-DDEPLOYMENT_RUNTIME_OBJC")
else()
    list(APPEND SWIFT_FLAGS "-DDEPLOYMENT_RUNTIME_SWIFT")
endif()

swift_add_library(TestFoundation SHARED MODULE_NAME "TestFoundation" SOURCES ${real_sources})
target_link_libraries(TestFoundation PRIVATE swiftSwiftXCTest)

add_executable(TestFoundationLauncher Launcher.cpp)
target_link_libraries(TestFoundationLauncher TestFoundation)

if("${CMAKE_SYSTEM_NAME}" STREQUAL "Android")
    add_subdirectory(Android)
endif()

# copy all resource files to build dir on all platforms except of Android
if(NOT "${CMAKE_SYSTEM_NAME}" STREQUAL "Android")
    set(res_dir "${CMAKE_CURRENT_SOURCE_DIR}/Resources")
    file(GLOB_RECURSE resources RELATIVE "${res_dir}" "${res_dir}/*")
    set(deps)
    foreach(res ${resources})
        set(input "${res_dir}/${res}")
        set(output "${CMAKE_CURRENT_BINARY_DIR}/${res}")
        add_custom_command(OUTPUT "${output}"
                           COMMAND "${CMAKE_COMMAND}" "-E" "copy" "${input}" "${output}"
                           DEPENDS "${input}")
        list(APPEND deps "${output}")
    endforeach()
    add_custom_target(TestFoundation-Resources-Copy ALL DEPENDS ${deps})
endif()

