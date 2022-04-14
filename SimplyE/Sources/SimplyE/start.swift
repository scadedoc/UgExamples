import Foundation
import ScadeKit

class SimplyE: SCDApplication {

	var window = SCDLatticeWindow()
  //var mainAdapter: MainPageAdapter!
  var loginPage : LoginPageAdapter!
  var bookDetail: BookInformationPageAdapter!
  var settings : SettingsPageAdapter!
  var booksList : BooksListPageAdapter!
  var readerSettings: ReaderSettingsPageAdapter!
  
	override func onFinishLaunching() {

		//mainAdapter = MainPageAdapter()
		
		loginPage = LoginPageAdapter()
		loginPage.load("Login.page")
		
		readerSettings = ReaderSettingsPageAdapter()
		readerSettings.load("ReaderSettings.page")
		
		bookDetail = BookInformationPageAdapter()
		bookDetail.load("BookInformation.page")
		
		settings = SettingsPageAdapter()
		settings.load("settings.page")
		
		booksList = BooksListPageAdapter()
		booksList.load("BooksList.page")
		
		//mainAdapter.load("main.page")
		loginPage.show(view: window)
		//booksList.show(view: window)
	}
}
