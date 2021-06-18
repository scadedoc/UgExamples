import ScadeKit
import Foundation
#if os(Android)	
	import FoundationNetworking
#endif

class TestResult {
	
	var name : String
	var stat : String
	var success : Bool
	var exclude : Bool
	
	
	init(name:String, stat:String,success:Bool) {
		self.name = name
		self.stat = stat
		self.success = success
		self.exclude = !success
	}
	
}

