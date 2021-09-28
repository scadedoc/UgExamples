import Foundation
import ScadeKit

class SimplyE: SCDApplication {

	var window = SCDLatticeWindow()
  	var mainAdapter: MainPageAdapter!
  	var loginPage : LoginPageAdapter!
  	var bookDetail: BookdetailsPageAdapter!
  	var settings : SettingsPageAdapter!
  	
	override func onFinishLaunching() {

		mainAdapter = MainPageAdapter()
		
		loginPage = LoginPageAdapter()
		loginPage.load("Login.page")
		
		bookDetail = BookdetailsPageAdapter()
		bookDetail.load("bookdetails.page")
		
		settings = SettingsPageAdapter()
		settings.load("settings.page")
		
		mainAdapter.load("main.page")
		loginPage.show(window)	
		
	}
}
