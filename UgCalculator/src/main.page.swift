import ScadeKit


class MainPageAdapter: SCDLatticePageAdapter {
	
	@objc dynamic var buffer:String = "0"
	var isOperatorMode = false
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		self.setupButtons()
	}
	
	func solveEqualtion(equation:String) -> String {
		let mathExpression = NSExpression(format: equation) 
		if let mathValue = mathExpression.expressionValue(with: nil, context: nil)  {
			return String(describing:mathValue)
		}
		return "Error"
	}
	
	func byThree(str:String) -> String {
		let endIndex = str.index(str.endIndex, offsetBy:-3)
		let x = str[str.startIndex..<endIndex]
		return String(x)
	}
	
	func process(_ input:String) {
		print(input)
		
		let isNumber = ["1","2","3","4","5","6","7","8","9","0"].contains(input) 
		if(isNumber) {
			
			if(buffer=="0") { buffer = input; return }
			buffer = buffer + input
			self.isOperatorMode = false
			return
		}
		
		let isOperator = ["+","-","/","*"].contains(input) 
		if(isOperator) {
			if(isOperatorMode) {
				buffer = byThree(str: buffer) + " \(input) "
				return
			}
			buffer = buffer + " \(input) "
			self.isOperatorMode = true
			return
		}
		
		let isClear = input == "A"
		if(isClear) {
			buffer = "0"
		}
		
		let isSolveEquation = ["="].contains(input) 
		if(isSolveEquation) {
			print(buffer)
			buffer = solveEqualtion(equation:buffer)
		}
		
	}
 
	
	func setupButtons(){ 
		
		let colorNumberDown = SCDGraphicsRGB(red:192,green:192,blue:192) // magnesiumlightGray
		let ColorNumberUp = SCDGraphicsRGB(red:100,green:101,blue:104) // "646568" // dark gray
		let operatorUp = "FF9E0B" // orange
		let operatorDown = "E18C0B" // gray orange
		
		let buttonNameInputs = 
			[("btnNumber1", "1"), // colorNumberDown ) ),
			 ("btnNumber2", "2"), // ColorNumberUp ) ),
			 ("btnNumber3","3"),
			 ("btnNumber4","4"),
			 ("btnNumber5","5"),
			 ("btnNumber6","6"),
			 ("btnNumber7","7"),
			 ("btnNumber8","8"),
			 ("btnNumber9","9"),
			 ("btnNumber0","0"),
			 ("btnPlus","+"),
			 ("btnMinus","-"),
			 ("btnDivide","/"),
			 ("btnMultiple","*"),
			 ("btnEqual","="),
			 ("btnClear","A"),
			 ]
			
		for (btnName,input) in buttonNameInputs {
			if let btn = self.page!.getWidgetByName(btnName) as? SCDWidgetsButton {
				
				print("init")
				
				btn.onClick.append( SCDWidgetsEventHandler {
					_ in 
						print(" hello \(input) ")
						self.process(input)
				})
						
				 let gestureHandler =  SCDSvgTapGestureRecognizer{ tap in 
					//let tapEvent = tap as! SCDSvgTapGestureRecognizer
					print("tabbed")
				 }
				 // set number of taps after which the gesture event is fired
				 gestureHandler.numTaps = 1
			//	btn.drawing!.gestureRecognizers.append(gestureHandler)
						
				}
			}
			
	}
	
}
