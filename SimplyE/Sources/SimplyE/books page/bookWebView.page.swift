import ScadeKit

import Foundation

class BookWebViewPageAdapter: SCDLatticePageAdapter {

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

  }

  override func show(view: SCDLatticeView?, data: Any) {
    super.show(view: view, data: data)

    if let book = data as? Book {

      guard let bookWebView = book.volumeInfo.previewLink else { return }

      guard let url = URL(string: bookWebView) else { return }

      guard let domain = url.host else { return }

      self.titleLabel.text = domain

      webView.load(bookWebView)

      self.doneButton.onClick { _ in
        self.navigation?.goWith(page: "BookDetail.page", data: book.id)
      }

      self.reloadButton.onClick { _ in
        self.webView.load(bookWebView)
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

}