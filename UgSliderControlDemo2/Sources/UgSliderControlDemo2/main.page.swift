import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {
	
	var percentage : String = "0"

	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		let slider  = self.page!.getWidgetByName("sliderLine1") as! SCDWidgetsSliderLine
		slider.onSlide.append(SCDWidgetsSlideLineEventHandler{ ev in self.onSlide(ev:ev!)})
	}
	
	func onSlide(ev:SCDWidgetsSlideLineEvent) {
		
		let oldValue = ev.oldValue
		let newValue = ev.newValue
		self.percentage = "\(ev.newValue)"		
		print("Old ---> new \(oldValue), \(newValue)")
		let label1 = self.page!.getWidgetByName("label1") as! SCDWidgetsLabel
		label1.text = "\(ev.newValue)"
	}
}
