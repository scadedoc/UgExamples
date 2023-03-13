import ScadeKit
import Foundation
#if os(Android)
	import FoundationNetworking
#endif

class MainPageAdapter: SCDLatticePageAdapter {
  
  override func load(_ path: String) {
    super.load(path)
    
   	// Creating camera object
    let camera = SCDPlatformCamera()
    
    // Success handler
    let _onSuccess = SCDPlatformCameraSuccessHandler { result in
      self.bitmap1.content = result
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
      camera.getPicture(SCDPlatformCameraOptions(sourceType: .photoLibrary), onSuccess: _onSuccess, onError: _onError)
    })
    
     
     // Upload
    uploadButton.onClick.append(SCDWidgetsEventHandler { event in
    	//self.uploadToFileIo(imageContent: self.bitmap.content)
    })
    
  }
  
  func uploadToFileIo(imageContent:String) {
	  // Upload image to internet server using Swift Foundation and www.File.io
	  // - curl -F "file=@test.txt" https://file.io
	  
	  // create MultiPart request for one file
	  let request : URLRequest = SingleMultipartUrlRequest(
		  fromUrl: "https://file.io", 
		  fileName: "c1.png", 
		  data: imageContent).generate()
	  
	  // create upload task
      let task = URLSession.shared.dataTask(with: request, completionHandler : { (data, response, error) in
            
    	  // print error
    	  if error != nil {
                print(error!.localizedDescription)
            }
            
      	  // return on empty data
          guard let data = data else { print("No data") ; return }
           
      	  // parse to json or return with error message
		  guard let json = try? JSONSerialization.jsonObject(with: data, options: [])
			      as? [String: Any] else {
			  		    print("error trying to convert data to JSON")
			     	    return
			    }
				    
      	 // print result
		  print(json)
            
        })

      // run task
      task.resume();
      
  }

}
