import ScadeKit
import Expression

class MainPageAdapter: SCDLatticePageAdapter {
	
	// variable buffer is used a model for model-view binding
	@objc dynamic var buffer:String = "0"
	
	var isOperatorMode = false
	
	let colorNumberKeyDefault = SCDGraphicsRGB(red:100,green:101,blue:104) // "646568" // dark gray
	let colorNumberKeyDown = SCDGraphicsRGB(red:192,green:192,blue:192) // magnesiumlightGray
	let colorOtherkeyDefault = SCDGraphicsRGB(red:69,green:71,blue:	76)
	let colorOtherkeyDown = SCDGraphicsRGB(red:100,green:101,blue:104) 
	let colorOperatorKeyDefault = SCDGraphicsRGB(red:255,green:158,blue:11)
	let colorOperatorKeyDown = SCDGraphicsRGB(red:216,green:133,blue:1)
	
	
	// Button ids and input
	lazy var  buttonNameInputs = 
			[("btnNumber1", ("1", colorNumberKeyDefault, colorNumberKeyDown) ), 
			 ("btnNumber2", ("2", colorNumberKeyDefault, colorNumberKeyDown) ), 
 			 ("btnNumber3", ("3", colorNumberKeyDefault, colorNumberKeyDown) ), 
 			 ("btnNumber4", ("4", colorNumberKeyDefault, colorNumberKeyDown) ), 
 			 ("btnNumber5", ("5", colorNumberKeyDefault, colorNumberKeyDown) ), 
 			 ("btnNumber6", ("6", colorNumberKeyDefault, colorNumberKeyDown) ), 
 			 ("btnNumber7", ("7", colorNumberKeyDefault, colorNumberKeyDown) ), 
 			 ("btnNumber8", ("8", colorNumberKeyDefault, colorNumberKeyDown) ), 
 			 ("btnNumber9", ("9", colorNumberKeyDefault, colorNumberKeyDown) ), 
 			 ("btnNumber0", ("0", colorNumberKeyDefault, colorNumberKeyDown) ), 
 			 
			 ("btnPlus",("+", colorOperatorKeyDefault,colorOperatorKeyDown) ),
			 ("btnMinus",("-", colorOperatorKeyDefault,colorOperatorKeyDown) ),
			 ("btnDivide",("/", colorOperatorKeyDefault,colorOperatorKeyDown) ),
			 ("btnMultiple",("*", colorOperatorKeyDefault,colorOperatorKeyDown) ),
			 ("btnEqual",("=", colorOperatorKeyDefault,colorOperatorKeyDown) ),
			 
			 ("btnClear",("A",colorOtherkeyDefault,colorOtherkeyDown) ),
			 ]
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		// send specific input for each button
		self.setupButtonActionsAndEffect()
		
	}
	
	func solveEqualtion(equation:String) -> String {
		let expression = Expression(equation)
		if let result = try? expression.evaluate()  { 
			return String(Int(result))
		}
		return "Error"
	}
	
	func shortenByThree(str:String) -> String {
		let endIndex = str.index(str.endIndex, offsetBy:-3)
		let x = str[str.startIndex..<endIndex]
		return String(x)
	}
	
	// This is the business logic to process the calculator input, display the input and
	// and compute results. This logic is for demonstration purposes  and not meant for production use. 
	func process(_ input:String) {

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
				buffer = shortenByThree(str: buffer) + " \(input) "
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
 
	func setupButtonActionsAndEffect(){ 
		
		// 1. change background color when pressed. 2. link actions to buttons
		for (btnName,input) in self.buttonNameInputs {
			
			// get button reference, but cast it to higher class SCDWidgetsWidget,
			// because the 0 button is not button, but a container and 
			// SCDWidgetsWidget represents both
			if let btn = self.page!.getWidgetByName(btnName) as? SCDWidgetsWidget {
 
				// create gesture
				let gestureHandler = SCDSvgPanGestureRecognizer{ tap in 
					print("gesture handler")
					switch(tap!.state) {
						case .began:
							btn.backgroundColor = input.2 // pressed color
						case .ended:
							btn.backgroundColor = input.1 // default color
							self.process(input.0)  // process input
						default: 
							return
					}
				}
				// Add gesture to button
			    btn.drawing!.gestureRecognizers.append(gestureHandler)
		    }
		} 
	}
	
}
