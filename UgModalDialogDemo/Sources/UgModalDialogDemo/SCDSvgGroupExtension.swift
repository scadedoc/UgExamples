
import ScadeKit

extension SCDSvgGroup {
	
	func distanceToBottom(height:Int) -> Float {
		return Float(height - self.getBoundingBox().location.y)
	}
	
	func distanceToBottom(of page:SCDWidgetsPage) -> Float {
		let height = page.maxArea.height
		return Float(height - self.getBoundingBox().location.y)
	}
	
}
