import Foundation
import ScadeKit

class SimplyE: SCDApplication {

	var window = SCDLatticeWindow()
  var mainAdapter: MainPageAdapter!
  var loginPage : LoginPageAdapter!
  var bookDetail: BookInformationPageAdapter!
  var settings : SettingsPageAdapter!
  
	override func onFinishLaunching() {

		mainAdapter = MainPageAdapter()
		
		loginPage = LoginPageAdapter()
		loginPage.load("Login.page")
		
		bookDetail = BookInformationPageAdapter()
		bookDetail.load("BookInformation.page")
		
		settings = SettingsPageAdapter()
		settings.load("settings.page")
		
		mainAdapter.load("main.page")
		loginPage.show(view: window)
	}
}
