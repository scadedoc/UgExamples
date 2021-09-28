import ScadeKit

class EreaderServiceManager {
	
	private static var ereader:EreaderService? 
		
	static func getInstance() -> EreaderService {
		
		if let reader = ereader {
			return reader
		}
		else {
			print("load model")
			let serviceModel = SCDRuntime.loadMetaModel("EreaderService.service")
        	let ereaderClass = serviceModel!.getEClassifier("EreaderService") as! EClass
        	print("before cast")
			ereader = serviceModel!.eFactoryInstance.create(eClass: ereaderClass) as? EreaderService
			print("after cast")
	
		}
		return ereader!
	}
}
