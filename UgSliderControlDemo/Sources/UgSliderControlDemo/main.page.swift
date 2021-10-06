import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {
	
	var percentage : String = "0"

	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		sliderLine.onSlide.append(SCDWidgetsSliderLineEventHandler{ ev in self.onSlide(ev:ev!)})
	}
	
	func onSlide(ev:SCDWidgetsSliderLineEvent) {
		
		let oldValue = ev.oldValue
		let newValue = ev.newValue
		self.percentage = "\(ev.newValue)"		
		label.text = String(newValue)
		print("Old ---> new \(oldValue), \(newValue)")
	}
}
