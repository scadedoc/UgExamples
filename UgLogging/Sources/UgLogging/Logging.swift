import ScadeKit
import os

enum SCDLoggingType : Int {
    case info = 1
    case error = 2
    case fault = 3
    case debug = 4
    case `default` = 5
}

func os_log(_ msg:StaticString, type: SCDLoggingType) {
	
	   let targetLoggingTypeString : String = {
		  switch type {
				case .info : return "[Info]"
				case .fault : return "[Fault]"
				case .error : return "[Error]"
				case .debug : return "[Debug]"
				case .`default` : return "[Default]"
		      }
		}()
		
	if #available(iOS 10.0, OSX 10.12, *) {
		
		let targetLoggingType : OSLogType = { 
		      switch type {
				case .info : return OSLogType.info
				case .fault : return OSLogType.fault
				case .error : return OSLogType.error
				case .debug : return OSLogType.debug
				case .`default` : return OSLogType.default
		      }
		}()
		
		os_log(msg, type: targetLoggingType)
		if #available(OSX 9.0,*) { 
			print("\(targetLoggingTypeString) \(msg)")
		}
		
	} else {
		
		// log for iOS < 10.0 that doesnt have os_log
		NSLog("\(targetLoggingTypeString) \(msg)")
	}
}

// convienence log function nicer syntax
func log( _ type: SCDLoggingType, msg: StaticString) {
	os_log(msg,type:type)
}
