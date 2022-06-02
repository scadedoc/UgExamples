import Foundation
import ScadeKit

#if os(Android)
  import FoundationNetworking
#endif

class MainPageAdapter: SCDLatticePageAdapter {

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    // adding 2nd page btn
    itmBinding.onClick { _ in self.navigation!.go(page: "BindingAndScalePage.page") }

    // get reference to second bitmap and set bitmap
    image2.url = "Assets/dog2.jpg"
    image2.contentPriority = false

    // Create URL
    let url = URL(
      string:
        "https://cdn.cocoacasts.com/cc00ceb0c6bff0d536f25454d50223875d5c79f1/above-the-clouds.jpg")!

    // Create Data Task
    let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
      if let data = data {
        self.image3.content = data
        self.image3.contentPriority = true
      }
    }
    dataTask.resume()

  }
}
