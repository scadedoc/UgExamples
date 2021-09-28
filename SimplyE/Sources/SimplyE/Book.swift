import ScadeKit

class Book : EObject {
	
	let id : String
	let title : String
	let author : String
	var bookCoverUrl : String = ""
	
	var published : String = ""
	var publisher : String = ""
	var category : String = ""
	var description1 : String = ""
	var description2 : String = ""
	
	var bookImageInternal : String? 
	var bookImage : String {
		get { return bookImageInternal ?? loadBookImage() }
	}
	
	init(id : String, url : String ) {
		self.id = id
		self.bookCoverUrl = url
		self.title = "unknown"
		self.author = "unknown"
	}
	
	init(id:String, title : String, author : String) {
		self.id = id
		self.title = title
		self.author = author
	}
	
	init(id:String, title : String, author : String, bookCoverUrl: String) {
		self.id = id
		self.title = title
		self.author = author
		self.bookCoverUrl = bookCoverUrl
	}
	
	func loadBookImage() -> String {
		self.bookImageInternal =  NetworkUtils.download(url:self.bookCoverUrl)
		return self.bookImageInternal!
	}
}
