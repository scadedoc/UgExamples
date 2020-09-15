import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		os_log("my message info", type: .info)
		os_log("my message debug", type: .debug)
		os_log("my message error", type: .error)
		os_log("my message fault", type: .fault)
		
		log(.info, msg: "Hello info Log")
	}
}
