import Foundation
import ScadeKit

class SimplyE: SCDApplication {

  var window = SCDLatticeWindow()

  override func onFinishLaunching() {

    //FavoriteDatabase.favoriteDB.savedBooks = FavoriteDatabase.favoriteDB.load()

    Navigation.show(.Login, in: window)

  }
}