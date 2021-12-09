import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

  let webpage = "https://developer.apple.com/reference/webkit/wkwebview"

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    // Add event to load page
    button.onClick {
      _ in self.webView.load(self.webpage)
    }

    // Add event when page loaded
    webView.onLoaded.append(
      SCDWidgetsLoadEventHandler {
        (ev: SCDWidgetsLoadEvent?) in print("Page Loaded: \(ev!.url)")
      })

    // Add event when page failed to load
    webView.onLoadFailed.append(
      SCDWidgetsLoadFailedEventHandler {
        (ev: SCDWidgetsLoadFailedEvent?) in print("Page failed to load \(ev?.message)")
      })

    // Add handler to control loading of page
    webView.onShouldLoad.append(
      SCDWidgetsShouldLoadEventHandler {
        (ev: SCDWidgetsLoadEvent?) in
        let rtn = !ev!.url.contains("loadhtmlstring")
        print("will load \(ev!.url) : \(rtn)")
        return rtn
      })

    button1.onClick { _ in
      self.getTitle()
    }

  }

  func getTitle() {
    let javascript = "var x=document.getElementsByTagName(\"title\")[0].text.toString();x"
    let processResult = SCDWidgetsWebViewEvalHandler { result in print(result) }
    let handleException = SCDWidgetsWebViewEvalHandler { error in print(error) }
    // inject javascript
    webView.eval(javascript, onSuccess: processResult, onError: handleException)
  }
}
