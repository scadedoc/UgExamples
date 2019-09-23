import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		
		// closure to process temperature
		let displayTemperature = {  (temperature:Double) in 
		     if let label = self.page!.getWidgetByName("lblTemperature") as? SCDWidgetsLabel {
				label.text = String(temperature)
			}
		}
		
		// retrieve temp async and invoke display function
		WeatherClient().getTemperaturFor(city:"London", onWeatherDataRetrieved: displayTemperature)
		
	}
}
