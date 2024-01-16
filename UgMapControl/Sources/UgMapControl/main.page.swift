import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {
	
	// set coordinates
	let perfectlySoftLocation = SCDPlatformLocationCoordinate(latitude:44.061334,longitude:-79.454920)
	let bestSushiLocation = SCDPlatformLocationCoordinate(latitude:43.655156,longitude:-79.385293)
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		btnToronto.onClick{ _ in self.goto(coordinates:self.perfectlySoftLocation) }
		
		btnCurrLoc.onClick{_ in self.gotoCurrentLocation()}
		
		btnSushi.onClick{_ in self.goto(coordinates:self.bestSushiLocation)}
		
		// let add buttons for setting map type
		btnStandard.onClick{_ in self.setMapType(self.btnStandard.name)}
		
		btnSatellite.onClick{_ in self.setMapType(self.btnHybrid.name)}
	
		btnHybrid.onClick{_ in self.setMapType(self.btnSatellite.name)}
		
		// demo annotation https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/LocationAwarenessPG/AnnotatingMaps/AnnotatingMaps.html
//		self.setPerfectlySoftPin()
//		
//		// demo overlays
		self.setOverlayAroundSushiPlace()
	}
	
	func setMapType(_ name:String) {
		
		switch(name) {
			case "btnHybrid":
				mapwidget1.mapType = SCDWidgetsMapType.hybrid
			case "btnSatellite":
				mapwidget1.mapType = SCDWidgetsMapType.satellite
			case "btnStandard":
				mapwidget1.mapType = SCDWidgetsMapType.standard
			default:
				print("not covered")
		}
	}
	
	func goto(coordinates:SCDPlatformLocationCoordinate) {
		  mapwidget1.setRegion(coordinates,latitudinalMeters:1000,longitudinalMeters:1000)
	}
	
	func setPerfectlySoftPin() {
		self.setPinAsAnnotaton(coordinate:perfectlySoftLocation,imagePath:"Assets/pinOrange.svg")
	}
	
	func setPinAsAnnotaton(coordinate:SCDPlatformLocationCoordinate, imagePath:String) {
		
		// We will further simplify the API
		let svgImage = SCDSvgImage(width:SCDSvgUnit(value:25),height:SCDSvgUnit(value:25))
		svgImage.xhref = imagePath
						
		let ann = SCDWidgetsMapAnnotation(location:coordinate)
		ann.drawing = svgImage
		
		mapwidget1.annotations.append(ann)
	}
	
	func setOverlayAroundSushiPlace() {
		
        // get the map specific coordinates
	    let coor2d = mapwidget1.convertFromGeoLocation(bestSushiLocation)
	    
	   	// Create overlay circle of radius 1000m 
	    let overlayCircle = SCDSvgCircle(cx:SCDSvgUnit(value:coor2d!.x),cy:SCDSvgUnit(value:coor2d!.y),r:SCDSvgUnit(value:1000))
	    overlayCircle.fill = SCDColor(r: 1, g: 0, b: 0, a: 0.2)
	    
	    // Create an overlay
	    let overlay = SCDWidgetsMapOverlay()
	    overlay.drawing = overlayCircle
	    
	    // Add overlay onto the map
	    mapwidget1.overlays.append(overlay)
	    
	}
	
	func gotoCurrentLocation() {	
		// currently, the desktop returns isShowUserLocation==false
		if(mapwidget1.showUserLocation) {
			let curr = mapwidget1.userLocation
			print(curr?.latitude ?? 0)
			print(curr!.longitude)
			mapwidget1.moveToUserLocation()
		}
	}	
}
