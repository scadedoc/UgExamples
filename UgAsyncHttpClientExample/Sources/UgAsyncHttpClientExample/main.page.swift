import ScadeKit
import AsyncHTTPClient
import Foundation


class MainPageAdapter: SCDLatticePageAdapter {

    @MainActor
    private func downloadDataAndUpdateUI() async {
        let httpClient = HTTPClient(eventLoopGroupProvider: .createNew)

        do {
            let request = HTTPClientRequest(url: "http://google.com/")
            let response = try await httpClient.execute(request, timeout: .seconds(30))
            self.label.text = "GOT RESPONSE: \(response.status)"
        }
        catch {
            print("ERROR: \(error)")
        }
        
        try! await httpClient.shutdown()
    }
  
    // page adapter initialization
    override func load(_ path: String) {
        super.load(path)

        Task {
            await downloadDataAndUpdateUI()
        }
    }
}
