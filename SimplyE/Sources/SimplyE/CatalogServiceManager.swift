class CatalogServiceManager {
	
	static func getCategories() -> [Category] {
		
		let values = [  ("Best Sellers","Best Sellers"),
	         			("Staff Picks","Staff Picks"),
	         			("Fiction","Fiction"),
	         			("Nonfiction","Nonfiction"),
	  	  ]
	  	  
		return values.map{Category(id:$0,label:$1)}
	}
	
	static func fromBookCategory(bc:BookCategory) -> Category  {
		// mapping function to transform from BookCategory (server) --> Book (client)
		let books : [Book] = bc.isbns.enumerated().map{let url = bc.urls[$0]; return Book(id:"\($1)",url:"\(url)")}
		return Category(id:bc.category,label:bc.category,books:books)
	}
	
}
