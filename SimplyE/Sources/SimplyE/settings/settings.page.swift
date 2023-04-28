import ScadeKit
import Foundation

class SettingsPageAdapter: SCDLatticePageAdapter {

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
    
    
    
    self.horinzontalView1.onClick { _ in
    	self.navigation?.go(page: "about.page")
    }
    
    self.horinzontalView3.onClick { _ in
    	self.navigation?.go(page: "contactUs.page")
    }
    
    self.toolBarItem1.onClick { _ in
      self.goBack()
    }

    self.toolBarItem2.onClick { _ in
      self.goToSearchPage()
    }

    self.toolBarItem3.onClick { _ in
      self.goToFavoritesPage()
    }
    
  }
  
  private func onClickShow() {
  	
  	if self.checkbox1.checked == true {
  		// dark theme
  	}
  	
  	else {
  		// light time
  	}
  	
  }
  
  func goBack() {
    self.navigation?.go(page: "main.page")
  }

  func goToSearchPage() {
    self.navigation?.go(page: "search.page")
  }

  func goToFavoritesPage() {
    self.navigation?.go(page: "favorited.page")
  }


}