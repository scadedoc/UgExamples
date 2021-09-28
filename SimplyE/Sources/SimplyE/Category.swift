import ScadeKit

class Category : EObject {
		let id : String
		let label : String 
		let books : [Book]
		
		init(id:String, label:String) {
			self.id = id
			self.label = label
			self.books = []
		}
		
		init(id:String, label:String, books:[Book]) {
			self.id = id
			self.label = label
			self.books = books
		}
}
