import ScadeKit
import Alamofire
import Dispatch

  
class MainPageAdapter: SCDLatticePageAdapter {
  
  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
 
    AF.request("https://httpbin.org/get").response { response in
      print("RESPONSE: \(response)")
      let str = String(decoding: response.data!, as: UTF8.self)
      print("RESPONSE DATA: \(str)")
      
      DispatchQueue.main.async {
        let label = self.page!.getWidgetByName("label") as! SCDWidgetsLabel
        label.text = str
      }
    }
  }
}
