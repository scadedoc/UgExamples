import ScadeKit

class NetworkUtils {
	
	 static func download(url:String) -> String {	
		print("Downloading \(url)")
		let request = SCDNetworkRequest()
		request.onError = SCDNetworkErrorHandler { responseError in
    		print("code: \(responseError!.code) message: '\(responseError!.message)'")
		}
		
		request.url = url
        if let response = request.call() {
        	print("called X out to the internet to get image. Statuscode \(url) \(response.statusCode)")
        	return response.body
		} else
        { 
			print("Timeout")
        }
		
		return ""
	}
}
