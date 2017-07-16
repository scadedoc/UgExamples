import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

  var bitmap : SCDWidgetsBitmap!
  var takePhotoButton : SCDWidgetsButton!
  var chooseFromLibraryButton : SCDWidgetsButton!
  
  override func load(_ path: String) {
    super.load(path)
    
    bitmap = page?.getWidgetByName("bitmap1") as! SCDWidgetsBitmap
    takePhotoButton = page?.getWidgetByName("button1") as! SCDWidgetsButton
    chooseFromLibraryButton = page?.getWidgetByName("button2") as! SCDWidgetsButton
    
   	// Creating camera object
    let camera = SCDPlatformCamera()
    
    // Success handler
    let _onSuccess = SCDPlatformCameraSuccessHandler { result in
      self.bitmap.content = result
    }
    
    // Error handler
    let _onError = SCDPlatformCameraErrorHandler { error in
      print(error)
    }
	
    // Take photo when button1 is clicked
    takePhotoButton.onClick.append(SCDWidgetsEventHandler { event in
      camera.getPicture(SCDPlatformCameraOptions(sourceType: .camera), onSuccess: _onSuccess, onError: _onError)
    })
    
     // Selecting from library when button2 is clicked
    chooseFromLibraryButton.onClick.append(SCDWidgetsEventHandler { event in
      camera.getPicture(SCDPlatformCameraOptions(sourceType: .photolibrary), onSuccess: _onSuccess, onError: _onError)
    })
    
  }

}
