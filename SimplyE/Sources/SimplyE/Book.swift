import Foundation
import ScadeKit

class Genre: EObject {
  let name: String
  let books: [Book]
  let lbCategory: String

  init(name: String, books: [Book], lbCategory: String) {
    self.name = name
    self.books = books
    self.lbCategory = lbCategory
  }
}

struct TrendingBookResponse: Codable {

  let items: [Book]
}

class Book: EObject, Codable {

  let id: String
  let volumeInfo: VolumeInfoElements
  let publisher: String?
  let previewLink: String?
}

struct VolumeInfoElements: Codable {

  let title: String?
  let subtitle: String?
  let authors: [String]
  let pageCount: Int?
  let imageLinks: imageLinksElements
  let description: String?
  let publishedDate: String?
  let language: String?
  let averageRating: Float?
}

struct imageLinksElements: Codable {

  let smallThumbnail: String?
  let thumbnail: String?
}

/*
{
      "kind": "books#volume",
      "id": "cdyoCwAAQBAJ",
      "etag": "WxflAY92zwU",
      "selfLink": "https://www.googleapis.com/books/v1/volumes/cdyoCwAAQBAJ",
      "volumeInfo": {
        "title": "Clawback",
        "subtitle": "An Ali Reynolds Novel",
        "authors": [
          "J.A. Jance"
        ],
        "publisher": "Simon and Schuster",
        "publishedDate": "2016-03-08",
        "description": "In New York Times bestselling author J.A. Jance’s latest thriller, Ali Reynolds faces her most controversial mystery yet, solving the murder of a man whose Ponzi scheme bankrupted hundreds of people, and left them seeking justice…or revenge. When Ali’s parents lose their life savings to a Ponzi scheme, her father goes to confront his long-time friend and financial advisor, only to stumble into the scene of a bloody double homicide. With her father suddenly a prime suspect, Ali and her husband work to clear her father’s name, while at the same time seeking justice for her parents as well as the scheme’s other suddenly impoverished victims, one of whom is a stone cold killer.",
        "industryIdentifiers": [
          {
            "type": "ISBN_13",
            "identifier": "9781501110726"
          },
          {
            "type": "ISBN_10",
            "identifier": "1501110721"
          }
        ],
        "readingModes": {
          "text": false,
          "image": false
        },
        "pageCount": 336,
        "printType": "BOOK",
        "categories": [
          "Fiction"
        ],
        "averageRating": 4,
        "ratingsCount": 5,
        "maturityRating": "NOT_MATURE",
        "allowAnonLogging": false,
        "contentVersion": "0.6.1.0.preview.0",
        "panelizationSummary": {
          "containsEpubBubbles": false,
          "containsImageBubbles": false
        },
        "imageLinks": {
          "smallThumbnail": "http://books.google.com/books/content?id=cdyoCwAAQBAJ&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
          "thumbnail": "http://books.google.com/books/content?id=cdyoCwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
        },
        "language": "en",
        "previewLink": "http://books.google.com/books?id=cdyoCwAAQBAJ&printsec=frontcover&dq=subject:thriller&hl=&as_ebook=1&cd=1&source=gbs_api",
        "infoLink": "http://books.google.com/books?id=cdyoCwAAQBAJ&dq=subject:thriller&hl=&as_ebook=1&source=gbs_api",
        "canonicalVolumeLink": "https://books.google.com/books/about/Clawback.html?hl=&id=cdyoCwAAQBAJ"
      },
      "saleInfo": {
        "country": "NG",
        "saleability": "NOT_FOR_SALE",
        "isEbook": false
      },
      "accessInfo": {
        "country": "NG",
        "viewability": "PARTIAL",
        "embeddable": true,
        "publicDomain": false,
        "textToSpeechPermission": "ALLOWED_FOR_ACCESSIBILITY",
        "epub": {
          "isAvailable": false
        },
        "pdf": {
          "isAvailable": false
        },
        "webReaderLink": "http://play.google.com/books/reader?id=cdyoCwAAQBAJ&hl=&as_ebook=1&source=gbs_api",
        "accessViewStatus": "SAMPLE",
        "quoteSharingAllowed": false
      }
    },
*/