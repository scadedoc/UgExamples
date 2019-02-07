import ScadeKit

class UgPagesDemo: SCDApplication {

 	let window = SCDLatticeWindow()
  	var mainAdapter: MainPageAdapter!
  	
 	#if os(Android)
    	func dataToString(data: SF_NSData, isUtf8: Bool) -> String {
    		let enc = isUtf8 ? String.Encoding.utf8 : String.Encoding.isoLatin1
     		let nsstring = SF_NSString(bytes: data.bytes, length: Int(data.length), encoding: enc.rawValue)

     		return String(nsstring)
   		}
  	#else
       	func dataToString(data: Data, isUtf8: Bool) -> String {
    		return String(data: data, encoding: isUtf8 ? .utf8 : .isoLatin1)!
  		}
  	#endif
  	
	override func onFinishLaunching() {
		saveAndLoadData()
	}
  	
  	 func saveAndLoadData() {
  		
		let data = "CrossPlatformSwift rocks"
		let location = "mystringdata.data"
		SCDRuntime.saveFile(location, content:data)
		
		let data2 = SCDRuntime.loadFile(location)
		let eq = data == dataToString(data: data2!, isUtf8: true)
		print(dataToString(data: data2!, isUtf8: true))
		print("worked = \(eq)")
  	}
}
