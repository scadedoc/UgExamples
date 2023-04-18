import ScadeKit

class AboutPageAdapter: SCDLatticePageAdapter {

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
  }

  override func show(view: SCDLatticeView?, data: Any) {
    super.show(view: view, data: data)

    let aboutWebView: String = "https://docs.scade.io/docs/how-scade-works"

    webView.load(aboutWebView)

    webView.onLoaded.append(
      SCDWidgetsLoadEventHandler { event in
        print("OnLoaded: \(String(describing: event?.url))")
      }
    )
    webView.onLoadFailed.append(
      SCDWidgetsLoadFailedEventHandler { event in
        print("NonLoaded: \(String(describing: event?.url))")
        print("NonLoaded: \(String(describing: event?.message))")
      }
    )

  }

}