import ScadeKit
import Foundation
#if os(Android)	
	import FoundationNetworking
#endif

class MainPageAdapter: SCDLatticePageAdapter {
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		
		// closure to process temperature
		let displayTemperature = {  (temperature:Double) in 
			self.lblTemperature.text = String(Double(round(10*temperature)/10))
		}
		
		// retrieve temp async and invoke display function
		WeatherClient().getTemperaturFor(city:"London", onWeatherDataRetrieved: displayTemperature)
		
	}
}
