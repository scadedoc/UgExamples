import Foundation

class DateDemo {
	
	func testDistantFuture() -> Bool {
		
		let d = Date.distantFuture
        let now = Date()
        
        return d > now
	}
	
}
