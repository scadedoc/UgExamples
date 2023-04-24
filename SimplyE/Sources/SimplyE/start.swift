import Foundation
import ScadeKit

#if os(Android)
  import FoundationNetworking
#endif

class SimplyE: SCDApplication {

  var window = SCDLatticeWindow()
  var mainAdapter: MainPageAdapter!
  var loginPage: LoginPageAdapter!
  var bookDetail: BookDetailPageAdapter!
  var searchPage: SearchPageAdapter!
  var bookWebView: BookWebViewPageAdapter!
  var settings: SettingsPageAdapter!
  var aboutPage: AboutPageAdapter!
  var contactUsPage: ContactUsPageAdapter!
  var favoritedPage: FavoritedPageAdapter!

  override func onFinishLaunching() {

    //FavoriteDatabase.favoriteDB.savedBooks = FavoriteDatabase.favoriteDB.load()

    mainAdapter = MainPageAdapter()

    loginPage = LoginPageAdapter()
    loginPage.load("Login.page")

    //bookDetail = BookInformationPageAdapter()

    //settings = SettingsPageAdapter()
    //settings.load("settings.page")

    bookDetail = BookDetailPageAdapter()
    bookDetail.load("BookDetail.page")

    searchPage = SearchPageAdapter()
    searchPage.load("search.page")

    bookWebView = BookWebViewPageAdapter()
    bookWebView.load("bookWebView.page")

    settings = SettingsPageAdapter()
    settings.load("settings.page")

    aboutPage = AboutPageAdapter()
    aboutPage.load("about.page")

    contactUsPage = ContactUsPageAdapter()
    contactUsPage.load("contactUs.page")

    favoritedPage = FavoritedPageAdapter()
    favoritedPage.load("favorited.page")

    mainAdapter.load("main.page")

    loginPage.show(view: window)
  }
}
