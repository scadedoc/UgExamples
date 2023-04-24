import ScadeKit
<<<<<<< HEAD
#if os(Android)
  import FoundationNetworking
#endif
=======
>>>>>>> 16106963cdec4a344c76661b62198ec6efe9e5eb

class ContactUsPageAdapter: SCDLatticePageAdapter {

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
  }

  override func show(view: SCDLatticeView?, data: Any) {
    super.show(view: view, data: data)
<<<<<<< HEAD
    
    self.doneButton.onClick { _ in
      self.navigation?.go(page: "settings.page")
    }

    let contactUsWebView: String =
      "https://www.scade.io/account/login/?redirect_to=https://www.scade.io/account#"
      
      guard let url = URL(string: contactUsWebView) else { return }

    guard let domain = url.host else {return}

    self.titleLabel.text = domain

    webView.load(contactUsWebView)
    
    self.reloadButton.onClick { _ in
        self.webView.load(contactUsWebView)
      }
=======

    let contactUsWebView: String =
      "https://www.scade.io/account/login/?redirect_to=https://www.scade.io/account#"

    webView.load(contactUsWebView)
>>>>>>> 16106963cdec4a344c76661b62198ec6efe9e5eb

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