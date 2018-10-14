import ScadeKit

class UgPagesDemo: SCDApplication {

 	let window = SCDLatticeWindow()
  	var mainAdapter: MainPageAdapter!
  	
  	func dataToString(data: Data) -> String {
		#if os(Android)
        	let pointer = data.bytes.bindMemory(to: CChar.self, capacity: Int(data.length))
        	return String(utf8String: pointer)!
    	#else
         	return String(data: data, encoding: .utf8)!
    	#endif
	}
  	
	override func onFinishLaunching() {
		saveAndLoadData()
	}
  	
  	 func saveAndLoadData() {
  		
		let data = "CrossPlatformSwift rocks"
		let location = "mystringdata.data"
		SCDRuntime.saveFile(location, content:data)
		
		let data2 = SCDRuntime.loadFile(location)
		let eq = data == dataToString(data: data2!)
		print("worked = \(eq)")
  	}
}
