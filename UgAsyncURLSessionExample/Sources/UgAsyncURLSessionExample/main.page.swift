import ScadeKit
import Foundation


class MainPageAdapter: SCDLatticePageAdapter {
  private func loadData() async throws {
    let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=aaa")!
    let (data, _) = try await URLSession.shared.data(from: url)
    let str = String(data: data, encoding: .utf8)!

    let widget = self.page!.getWidgetByName("label") as! SCDWidgetsLabel
    widget.text = String(str.prefix(100))
  }

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
    
    Task { @MainActor in
      try await loadData()
    }
  }
}
