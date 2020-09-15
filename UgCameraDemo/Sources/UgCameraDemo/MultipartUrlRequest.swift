import ScadeKit

class SingleMultipartUrlRequest {
	
	/* Generate multipart request for single file */
	let fromUrl : String
	let fileName : String
	let data : String
	
	init(fromUrl:String, fileName : String, data : String) {
		self.fromUrl = fromUrl
		self.fileName = fileName
		self.data = data 
	}
	
	// Support for single impage
	func generate() -> URLRequest {
		
		// get URL object
		let url = URL(string:fromUrl)
		
		// create UrLRequest
		var request = URLRequest(url:url!) 
	
		// set boundary (boundary is abitrary ASCII string to devide multipe parts)
		let boundary = "--12345SCADE"
		
		// compute content type
		let contentType = "multipart/form-data; boundary=\(boundary)"
		
		// content body
		let body = generateBody(boundary: boundary, part: self.data, fileName: self.fileName)
		
		// compute MANDATORY content length
		let contentLength = String(body.count)
		
		// populate request
		request.setValue(contentType, forHTTPHeaderField: "Content-Type")
		request.setValue(contentLength, forHTTPHeaderField: "Content-Length")
		request.httpBody = body
		request.httpMethod = "POST"
		
		return request
	}
	
	func generateBody(boundary:String,part:String, fileName:String) -> Data {
		
		/*
			Build body
			1. Starting boundary 
			2. Content-Disposition (name and filename)
			3. Content-Type
			4. data
			5. Ending boundary prefixed by CR and enclosed in --
		
		*/
		
		let cr = "\r\n"
		let imageType = "png"
		
		// 1. Starting boundary
		let startBoundary = "--" + boundary + cr
		
		// 2. Content-Disposition https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Disposition
		let contentDisposition = "Content-Disposition: form-data; name=\"file\"; filename=\"" + fileName + "\"\r\n"
		
		// 3. ContentType
		let contentType = "Content-Type: image/" + imageType + "\r\n\r\n"
		
		// 4. data
		let content = part
		
		// 5. end
		let endBoundary = cr + "--" + boundary + "--"		

		// create body
		var body = Data()
		
		body.append(startBoundary.data(using: String.Encoding.utf8)!)
		body.append(contentDisposition.data(using: String.Encoding.utf8)!)
		body.append(contentType.data(using: String.Encoding.utf8)!)
		
		// <!-- USE isoLatin1 for the IMAGE 
		body.append(content.data(using: String.Encoding.isoLatin1)!)
		// USE isoLatin1 for the IMAGE -->
		
		body.append(endBoundary.data(using: String.Encoding.utf8)!)
	
		return body
	}
}
