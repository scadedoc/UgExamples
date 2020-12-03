import ScadeKit

class TextboxAnimatedPageAdapter: SCDLatticePageAdapter {
	
	let duration : Float = 0.25
	let fromColorGray = SCDSvgRGBColor(r:0.66,g:0.66,b:0.66)
	let toColorLime = SCDSvgRGBColor(r:0,g:1,b:0)
	var textboxState : [String:Bool] = [:]
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
	}
	
	override func show(view: SCDLatticeView?) {
		super.show(view: view)
		
		// register touch events and setup initial display
		self.setup()
	}
	
	func createPropertyAnimation(of:String,values:[Any]) -> SCDSvgPropertyAnimation {
		// Helper function
		let animation : SCDSvgPropertyAnimation = SCDSvgPropertyAnimation(of, values: values)
		animation.duration = self.duration
		animation.additive = false
		return animation
	}	
	
	func setup() {
		["Username","Lastname"].forEach {
			// register event
			if let textWidget = self.page!.getWidgetByName("text\($0)") as? SCDWidgetsCustomWidget {
				let name = $0
				textWidget.onClick.append( SCDWidgetsEventHandler{ _ in self.onTextboxFocus(of:name,on:true) } )
			}
			// set textbox event
			if let textbox = self.page!.getWidgetByName("tb\($0)") as? SCDWidgetsTextbox {
				let name = $0
				print("adding")
				textbox.onEditFinish.append(SCDWidgetsEditFinishEventHandler{ _ in self.onLeaveTextbox(named:name) })
			}
			
			// set textbox to invisible
			self.setTextboxVisibility(of:"tb\($0)",to:false)
			
			// set state
			self.textboxState[$0] = false
		}
	}
	
	func onLeaveTextbox(named:String) {
		print(named)
	}
	
	func createPropertyAnimation(of:String,from:Double,to:Double) -> SCDSvgPropertyAnimation {
		// Helper function
		let animation = SCDSvgPropertyAnimation(of, from:from, to:to)
		animation.duration = self.duration
		animation.additive = false
		return animation
	}
	
	func onTextboxFocus(of:String,on:Bool) {
		if(on) {
			self.animateIn(textIdBy: "text\(of)1", lineIdBy: "line\(of)1")
			self.setTextboxVisibility(of:"tb\(of)",to:true)
		}
	}
	
	func getParameter(direction:Bool,textByRef:SCDSvgText!, lineByRef:SCDSvgLine!) -> (Double,Double,[Double], [SCDSvgRGBColor],[Double]) {
		
		let text = textByRef
		let line = lineByRef
		
		// get Y animation from and to
		let fromY = Double( text!.y.value) 
		let y1 = Double( text!.getBoundingBox()!.location.y)
		let y2 = Double( line!.getBoundingBox()!.location.y) + Double(line!.getBoundingBox()!.bounds.height)
		let toY = fromY+(y2-y1)
		
		// get font scaling parameter
		let fromFontSize = Double(text!.fontSize)
		let toFontSize = Double(fromFontSize) * 0.7
		let distance = fromFontSize - toFontSize
		let scalingValuesFontSize = Array(1...20).map{ fromFontSize - ( distance / ( 20.00 / Double($0) ) )}
		
		return direction ? (fromY,toY,scalingValuesFontSize,[fromColorGray,toColorLime],[7,2]) : (toY,fromY,scalingValuesFontSize.reversed(),[toColorLime,fromColorGray],[2,7])
	}
	
	
	func animateIn(textIdBy:String, lineIdBy:String) {
		
		let text = self.page!.drawing!.findById(textIdBy) as? SCDSvgText
		let line = self.page!.drawing!.findById(lineIdBy) as? SCDSvgLine
		
		let (fromY,toY,fontScalingValues,colorRange,strokeWidthRange) = getParameter(direction:true,textByRef:text!, lineByRef: line!)
		
		let YAnimation = createPropertyAnimation(of:"y", from:fromY, to:toY)
		let fontSizeAnimation = createPropertyAnimation(of:"fontSize", values : fontScalingValues)
		let animateColor = createPropertyAnimation(of:"fill",values:colorRange)
		let strokeWidthAnimation = createPropertyAnimation(of:"strokeWidth", values:strokeWidthRange)
		let strokeColorAnimation = createPropertyAnimation(of:"stroke",values:colorRange)
		
		let textAnimations = SCDSvgGroupAnimation()
		textAnimations.animations = [ YAnimation, fontSizeAnimation, animateColor]
		
		let lineAnimations = SCDSvgGroupAnimation()
		lineAnimations.animations = [ strokeWidthAnimation, strokeColorAnimation]
		
		// set animations to elements
		line!.animations.append(lineAnimations)
		text!.animations.append(textAnimations)
	}
	
	func setTextboxVisibility(of:String, to:Bool) {
		if let textbox = self.page!.getWidgetByName(of) {
			textbox.visible = to
			//(textbox.layoutData as! SCDLayoutXYLayoutData).isExcluded = !to
		}
	}
	
	func getMotionAnimation() {
		
	}
	
}
