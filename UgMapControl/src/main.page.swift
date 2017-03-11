import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

	var mapWidget : SCDWidgetsMapWidget!
	
	// set coordinates
	let perfectlySoftLocation = SCDPlatformLocationCoordinate(latitude:44.061334,longitude:-79.454920)
	let bestSushiLocation = SCDPlatformLocationCoordinate(latitude:43.655156,longitude:-79.385293)
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		self.mapWidget = self.page!.getWidgetByName("mapwidget1") as! SCDWidgetsMapWidget
		
		let button = self.page!.getWidgetByName("btnToronto") as! SCDWidgetsButton
		button.onClick.append(SCDWidgetsEventHandler{ _ in self.goto(coordinates:self.perfectlySoftLocation) })
		
		let btnCurrLoc = self.page!.getWidgetByName("btnCurrLoc") as! SCDWidgetsButton
		btnCurrLoc.onClick.append(SCDWidgetsEventHandler{_ in self.gotoCurrentLocation()})
		
		let btnSushi = self.page!.getWidgetByName("btnSushi") as! SCDWidgetsButton
		btnSushi.onClick.append(SCDWidgetsEventHandler{_ in self.goto(coordinates:self.bestSushiLocation)})
		
		// let add buttons for setting map type
		let btnStandard = self.page!.getWidgetByName("btnStandard") as! SCDWidgetsButton
		btnStandard.onClick.append(SCDWidgetsEventHandler{_ in self.setMapType(btnStandard.name)})
		
		let btnHybrid = self.page!.getWidgetByName("btnSatellite") as! SCDWidgetsButton
		btnHybrid.onClick.append(SCDWidgetsEventHandler{_ in self.setMapType(btnHybrid.name)})
	
		let btnSatellite = self.page!.getWidgetByName("btnHybrid") as! SCDWidgetsButton
		btnSatellite.onClick.append(SCDWidgetsEventHandler{_ in self.setMapType(btnSatellite.name)})
		
		// demo annotation https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/LocationAwarenessPG/AnnotatingMaps/AnnotatingMaps.html
		self.setPerfectlySoftPin()
		
		// demo overlays
		self.setOverlayAroundSushiPlace()
	}
	
	func setMapType(_ name:String) {
		
		switch(name) {
			case "btnHybrid":
				self.mapWidget.mapType = SCDWidgetsMapType.hybrid
			case "btnSatellite":
				self.mapWidget.mapType = SCDWidgetsMapType.satellite
			case "btnStandard":
				self.mapWidget.mapType = SCDWidgetsMapType.standard	
			default:
				print("not covered")
		}
	}
	
	func goto(coordinates:SCDPlatformLocationCoordinate) {
		  self.mapWidget.setRegion(coordinates,latitudinalMeters:1000,longitudinalMeters:1000)
	}
	
	func setPerfectlySoftPin() {
		self.setPinAsAnnotaton(coordinate:perfectlySoftLocation,imagePath:"res/pinOrange.svg")
	}
	
	func setPinAsAnnotaton(coordinate:SCDPlatformLocationCoordinate, imagePath:String) {
		
		// We will further simplify the API
		let svgImage = SCDSvgImage(width:SCDSvgUnit(value:25),height:SCDSvgUnit(value:25))
		svgImage.xhref = imagePath
						
		let ann = SCDWidgetsMapAnnotation(location:coordinate)
		ann.drawing = svgImage
		
		self.mapWidget.annotations.append(ann)
	}
	
	func setOverlayAroundSushiPlace() {
		
        // get the map specific coordinates
	    let coor2d = mapWidget.convert(fromGeoLocation: bestSushiLocation)
	    
	   	// Create overlay circle of radius 1000m 
	    let overlayCircle = SCDSvgCircle(cx:SCDSvgUnit(value:coor2d.x),cy:SCDSvgUnit(value:coor2d.y),r:SCDSvgUnit(value:1000))
	    overlayCircle.fill = SCDSvgRGBColor(a:0.2,r:1,g:0,b:0)
	    
	    // Create an overlay
	    let overlay = SCDWidgetsMapOverlay()
	    overlay.drawing = overlayCircle
	    
	    // Add overlay onto the map
	    mapWidget.overlays.append(overlay)
	    
	}
	
	func gotoCurrentLocation() {	
		// currently, the desktop returns isShowUserLocation==false
		if(mapWidget.isShowUserLocation) {
			let curr = mapWidget.userLocation
			print(curr.latitude)
			print(curr.longitude)
			mapWidget.moveToUserLocation()
		}
	}
	
}
