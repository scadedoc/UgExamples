import Foundation

class HttpClientSample {

	let plainTextData = "SCADE plain text data"
	let jsonData = 
		"""
			{
			  "SimpleData" : [
			    1,2,3]
			}
		"""
		
	func postSample() -> Bool {

		// define target
		let url = URL(string: "https://httpbin.org/post")! 

	   //create the session object
	   let session = URLSession.shared

	   //now create the URLRequest object using the url object
	   var request = URLRequest(url: url)
	   
	   // set to post - don't know why apple guys didn't use constants
	   request.httpMethod = "POST"
	   request.httpBody = plainTextData.data(using: .utf8) 
	
	   // create task
	   let task = session.dataTask(with:request,completionHandler: { data, response, error in
		   print(response!)
		   print("executed task successfully")
		   
		   let str = String(data: data!, encoding: .utf8)
		   print(str!)
	   })
	   // Resume task to execute it
	   task.resume()
	   
	   return true
		
	}
	
}
