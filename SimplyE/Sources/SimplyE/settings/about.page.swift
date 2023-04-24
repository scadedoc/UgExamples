import ScadeKit

#if os(Android)
  import FoundationNetworking
#endif

class AboutPageAdapter: SCDLatticePageAdapter {

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
  }

  override func show(view: SCDLatticeView?, data: Any) {
    super.show(view: view, data: data)

    self.doneButton.onClick { _ in
      self.navigation?.go(page: "settings.page")
    }

    let aboutWebView: String = "https://docs.scade.io/docs/how-scade-works"
    
    guard let url = URL(string: aboutWebView) else { return }

    guard let domain = url.host else {return}

    self.titleLabel.text = domain

    webView.load(aboutWebView)
    
    self.reloadButton.onClick { _ in
        self.webView.load(aboutWebView)
      }

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
