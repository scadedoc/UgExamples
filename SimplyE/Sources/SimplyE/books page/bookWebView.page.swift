import Foundation
import ScadeKit

class BookWebViewPageAdapter: SCDLatticePageAdapter {

  var url: URL?

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    self.doneButton.onClick { _ in
      Navigation.back()
    }

    self.reloadButton.onClick { _ in
      self.webView.load(self.url?.absoluteString ?? "")
    }

  }

  override func show(view: SCDLatticeView?, data: Any) {
    super.show(view: view, data: data)

    if let book = data as? Book {

      guard let bookWebView = book.volumeInfo.previewLink else { return }

      guard var url = URL(string: bookWebView) else { return }

      guard let domain = url.host else { return }

      self.titleLabel.text = domain

      // force using https in all requests
      if url.scheme == "http" {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.scheme = "https"
        url = components.url!
        self.url = components.url!

      }

      webView.load(url.absoluteString)

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