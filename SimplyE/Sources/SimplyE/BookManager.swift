class BookManager {

	static let sharedInstance : BookManager = BookManager()
	let classicBooks : [Book]
	var categories : [ String : [Book]] = [:]
	var books : [String : Book] = [:]

	private init() {
		
		let prefix = "res/bookCovers/"
		
		let classicBookData = [
		       	("1984","1984.jpeg"),
		       	("Alice in Wonderland","aliceInWonderland.jpeg"),
		       	("The Great Gatsby","greatGatsby.jpeg"),
		       	("The Journey to the Center of the Earth","journeyToCenterOfEarth.jpeg"),
		       	("Pride and Prejudice","PrideAnPrejedice.jpeg"),
		       	("The Hobbit","theHobbit.jpeg"),
		       	("Treasure Island","treasureIsland.jpeg"),
		       	("War of Worlds","warOfWorlds.jpeg")
		      ]
		      
		let  booksdata = ["Best Sellers":[("0345531108","https://images.gr-assets.com/books/1449683242m/27272224.jpg"),("0316407011","https://images.gr-assets.com/books/1439497650m/23341628.jpg"),("0544272889","https://images.gr-assets.com/books/1445050195m/25897805.jpg"),("184655859X","https://images.gr-assets.com/books/1440454476m/24909785.jpg")],
		         "Staff Picks":[("0812983432","https://images.gr-assets.com/books/1418767826m/23278597.jpg"),("0385736835","https://images.gr-assets.com/books/1419181230m/23582285.jpg"),("1444776770","https://s.gr-assets.com/assets/nophoto/book/111x148-bcc042a9c91a29c1d680899eff700a03.png"),("0812979524","https://images.gr-assets.com/books/1474497772m/30268564.jpg")],
		         "Fiction":[("0595002021","https://s.gr-assets.com/assets/nophoto/book/111x148-bcc042a9c91a29c1d680899eff700a03.png"),("0062264990","https://images.gr-assets.com/books/1348526911m/16045320.jpg"),("1943772320","https://images.gr-assets.com/books/1428084310m/19504964.jpg"),("0062003070","https://images.gr-assets.com/books/1335990320m/13005984.jpg"),("1402286619","https://images.gr-assets.com/books/1402544727m/18509608.jpg")],
		         "Nonfiction":[("1416597999","https://images.gr-assets.com/books/1400892526m/6582908.jpg"),("0312198213","https://images.gr-assets.com/books/1311986684m/1746602.jpg"),("030788497X","https://images.gr-assets.com/books/1394857918m/17288598.jpg"),("1455509647","https://images.gr-assets.com/books/1366559024m/15791128.jpg")]
		         ]

		         
		for bookdata in booksdata {
			var books = [Book]()
			for x in bookdata.1  {
				books.append(Book(id:x.0,url:x.1))
			}
			categories[bookdata.0] = books	
		}
		
		
		self.classicBooks =
		 	classicBookData.enumerated().map{ Book(id:String($0),title:$1.0,author:"Frank",bookCoverUrl:"\(prefix)\($1.1)") }
	}
	
	func getBooks(categoryId:String) -> [Book] {
		let books =  self.categories[categoryId]!
		print("number of books \(books.count)")
		return books
	}
	
	func getBook(isbn:String) -> Book? {
		if let book = books[isbn] {
			print("book found in memory")
			return book
		}
		if let book = retrieveBook(isbn:isbn) {
			print("saving book to memory")
			self.books[isbn] = book
			return book
		}
		return nil
	}
	
	func retrieveBook(isbn:String) -> Book? {
		let bookdetail = EReaderService.getBookByIsbn(isbn:isbn)
		let book = getBookFromBookDetailResponse(bookdetail:bookdetail!)
		return book // book
	}
	
	func getBookFromBookDetailResponse( bookdetail : BookDetailResponse) -> Book? {
		let book = Book(id:bookdetail.isbn, title: bookdetail.title, author :bookdetail.author , bookCoverUrl: bookdetail.imageurl)
		book.description1 = bookdetail.description
		book.description2 = bookdetail.description2
		book.published = bookdetail.published
		book.publisher = bookdetail.publisher
		
		return book
	}
	
}

