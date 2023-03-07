import ScadeKit


class Calculator {
	private var adapter: MainPageAdapter

	public init(adapter: MainPageAdapter) {
		self.adapter = adapter
	}

    func runCalculation() {
    	print("runCalculation BEGIN")
        Task.detached(priority: .background) {
        	print("runCalculation BACKGROUND")
            let _ = await self.asyncCalculation()
            print("runCalculation BACKGROUND 1")
            await MainActor.run {
            	print("runCalculation SET TEXT")
            	self.adapter.label.text = "Async task finished!"
            }
            print("runCalculation BACKGROUND END")
        }

        print("runCalculation END")
    }


    func asyncCalculation() async -> Bool {
        await Task.sleep(3 * 1_000_000_000)
        return true
    }
}


class MainPageAdapter: SCDLatticePageAdapter {
	var calc: Calculator?
  
  	// page adapter initialization
  	override func load(_ path: String) {
    	super.load(path)
    	
    	calc = Calculator(adapter: self)
    	
    	self.button.onClick { _ in
    		self.calc!.runCalculation()
    	}
  	}
}
