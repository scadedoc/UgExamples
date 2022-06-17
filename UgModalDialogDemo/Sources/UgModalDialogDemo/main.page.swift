import ScadeKit

#if os(iOS)
  import UIKit
#endif

#if os(Android)
  import Android
  import AndroidApp
  import AndroidContent
#endif

class MainPageAdapter: SCDLatticePageAdapter {

  // create instance of the modal content page
  let modalContentPage = ModalContentPagePageAdapter()

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    // Load the page (one time in the load method of the main page)
    modalContentPage.load("ModalContentPage.page")

    // Specify behaviour when leaving the modal dialog
    modalContentPage.onExit = { print("left modalDialog \($0)") }

    // Display custom modal content page when button on main page is clicked
    btnCustomModalDialog.onClick {

      // the show method is custom method that uses
      // the window instantiated within the modalContentPage class
      _ in self.modalContentPage.show()
    }

    // Add action to iOSAlertController button
    btnAlertController.onClick {

      // Should native iOS Alert Controler view
      _ in self.showUIAlertController()
    }

    #if os(Android)
      self.btnAlertController.text = "Android AlertDialog"
    #endif
  }

  func showUIAlertController() {
    // A example of how to display the UIAlertController on iOS
    // This is the same Swift code you would write on XCode
    // It works only on iOS, therefore the #if #endif command for conditional compilation
    //
    // Important. Use SCDApplication.rootViewController to access the UIViewController instance

    #if os(iOS)

      let alert = UIAlertController(
        title: "Did you bring your towel?",
        message: "It's recommended you bring your towel before continuing.",
        preferredStyle: .alert)

      alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in print("yes") }))

      alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { _ in print("no") }))

      SCDApplication.rootViewController?.present(alert, animated: true)

    #endif

    /**
	     * An Android implementation of the AlertDialog(android.app.AlertDialog) using
	     * swift-android repository
	     * It works only for Android explicitly
	     */

    #if os(Android)

      let builder: AlertDialogBuilder = AlertDialogBuilder(context: Application.currentActivity!)
      builder.setTitle(title: "Did you bring your towel?")
      builder.setMessage(message: "It's recommended you bring your towel before continuing.")

      // setting buttons
      builder.setPositiveButton(text: "Yes", listener: nil)
      builder.setNegativeButton(text: "No", listener: nil)

      let dialog: AlertDialog = builder.create()!

      dialog.show()
      print("Dialog shown")

    #endif
  }
}
