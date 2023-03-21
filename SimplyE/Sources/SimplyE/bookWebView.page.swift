import ScadeKit

class BookWebViewPageAdapter: SCDLatticePageAdapter {

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

  }

  override func show(view: SCDLatticeView?, data: Any) {
    super.show(view: view, data: data)

    if let book = data as? Book {

      guard let bookWebView = book.volumeInfo.previewLink else { return }

      webView.load(bookWebView)

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

}