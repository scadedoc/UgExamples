import ScadeKit

class TestResult {
	
	@objc dynamic var name : String
	@objc dynamic var stat : String
	@objc dynamic var success : Bool
	@objc dynamic var exclude : Bool
	
	
	init(name:String, stat:String,success:Bool) {
		self.name = name
		self.stat = stat
		self.success = success
		self.exclude = !success
	}
	
}
