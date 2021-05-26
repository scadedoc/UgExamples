import ScadeKit
  
class Pic : EObject { 
	
	let url : String
	
	init(_ filename:String) {
		self.url = "./assets/\(filename)"
	}

}

class MainPageAdapter: SCDLatticePageAdapter {

  
  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
    
    // elementProvider binds data to a visual element 
    self.slider1.elementProvider = SCDWidgetsElementProvider { (item: Pic, template) in
      
        guard let image = template.getWidgetByName("image1") as? SCDWidgetsImage else { return }

        image.url = item.url
        image.contentPriority = false
      }
      
    // items are contain the mode of the slider, the data is displayed
    self.slider1.items = [ Pic("1.png") ,  Pic("2.png"), Pic("3.png") ]
    
    // Use the onSlide handler to capture slide events
    self.slider1.onSlide.append(SCDWidgetsSlideEventHandler {e in print(e!.from,e!.to) })

  }
  
  override func show(view: SCDLatticeView?) {
  	super.show(view:view)
  	
  	// selected works only within the show function
  	self.slider1.selected = 1
  }
  
 
 
  
  }
