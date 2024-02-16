import ScadeKit

#if os(iOS)
  import UIKit
#endif

#if os(Android)
  import Android
  import AndroidApp
  import AndroidContent
#endif

class AddExercisePageAdapter: SCDLatticePageAdapter {

  var bottomSheetVC: UIViewController?

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    self.addExerciseButton.onClick { _ in
      self.showUIBottomSheetController()
    }

  }

  func showUIBottomSheetController() {

    #if os(iOS)

      // Create a UIViewController that will act as your bottom sheet
      self.bottomSheetVC = UIViewController()

      // Get the device's height
      let deviceHeight = UIScreen.main.bounds.height

      // Calculate the bottom sheet height (40% of the device's height)
      let bottomSheetHeight = deviceHeight * 0.32  // 40% of the device's height

      // Customize the appearance of your bottom sheet
      let bottomSheetWidth = UIScreen.main.bounds.width

      bottomSheetVC?.view.backgroundColor = .clear  // Set transparent background for the bottom sheet
      bottomSheetVC?.view.clipsToBounds = true
      bottomSheetVC?.view.layer.cornerRadius = 16  // Optional: Round corners for visual effect

      // Add UI elements to the bottom sheet (e.g., buttons)
      let buttonHeight: CGFloat = 56  // Set the height for each button

      let buttonWidth = bottomSheetWidth - 16  // Adjusted width for buttons with padding

      // Create Button 1 with only top-left and top-right corners rounded
      let button1 = UIButton(
        frame: CGRect(x: 8, y: 20, width: Int(buttonWidth), height: Int(buttonHeight)))
      let maskPath1 = UIBezierPath(
        roundedRect: button1.bounds,
        byRoundingCorners: [.topLeft, .topRight],
        cornerRadii: CGSize(width: 14, height: 14))
      let maskLayer1 = CAShapeLayer()
      maskLayer1.path = maskPath1.cgPath
      button1.layer.mask = maskLayer1
      button1.setTitle("Add Exercise", for: .normal)
      button1.setTitleColor(.black, for: .normal)
      button1.backgroundColor = .white
      button1.titleLabel?.font = UIFont(name: "SFPro-Semibold", size: 17)
      button1.layer.borderColor = UIColor.gray.cgColor
      button1.layer.borderWidth = 0.1
      button1.addTarget(self, action: #selector(button1Action), for: .touchUpInside)
      bottomSheetVC?.view.addSubview(button1)

      // Create Button 2 and Button 3 with regular corners
      let button2 = UIButton(
        frame: CGRect(
          x: 8, y: 20 + Int(buttonHeight), width: Int(buttonWidth), height: Int(buttonHeight)))
      button2.setTitle("Select Exercise from Collection", for: .normal)
      button2.setTitleColor(.black, for: .normal)
      button2.backgroundColor = .white
      button2.titleLabel?.font = UIFont(name: "SFPro-Semibold", size: 17)
      button2.layer.borderColor = UIColor.gray.cgColor
      button2.layer.borderWidth = 0.1
      button2.addTarget(self, action: #selector(button2Action), for: .touchUpInside)
      bottomSheetVC?.view.addSubview(button2)

      let button3 = UIButton(
        frame: CGRect(
          x: 8, y: 20 + Int(buttonHeight * 2), width: Int(buttonWidth), height: Int(buttonHeight)))
      button3.setTitle("Add Pause", for: .normal)
      button3.setTitleColor(.black, for: .normal)
      button3.backgroundColor = .white
      button3.titleLabel?.font = UIFont(name: "SFPro-Semibold", size: 17)
      button3.layer.borderColor = UIColor.gray.cgColor
      button3.layer.borderWidth = 0.1
      button3.addTarget(self, action: #selector(button3Action), for: .touchUpInside)
      bottomSheetVC?.view.addSubview(button3)

      // Create Button 4 with all corners rounded
      let button4 = UIButton(
        frame: CGRect(
          x: 8, y: 20 + Int(buttonHeight * 3) + 8, width: Int(buttonWidth),
          height: Int(buttonHeight)))
      let maskPath4 = UIBezierPath(roundedRect: button4.bounds, cornerRadius: 14)
      let maskLayer4 = CAShapeLayer()
      maskLayer4.path = maskPath4.cgPath
      button4.layer.mask = maskLayer4
      button4.setTitle("Cancel", for: .normal)
      button4.setTitleColor(.black, for: .normal)
      button4.backgroundColor = .white
      button4.titleLabel?.font = UIFont(name: "SFPro-Semibold", size: 17)
      button4.layer.borderColor = UIColor.gray.cgColor
      button4.layer.borderWidth = 1.0
      button4.addTarget(self, action: #selector(button4Action), for: .touchUpInside)
      bottomSheetVC?.view.addSubview(button4)

      // Present the custom-sized bottom sheet with a darkened background
      if let mainWindow = UIApplication.shared.windows.first, let bottomSheetVC = self.bottomSheetVC
      {
        // Create a semi-transparent overlay view
        let overlayView = UIView(frame: mainWindow.bounds)
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5)  // Adjust alpha for the darkness level
        overlayView.isUserInteractionEnabled = false  // Allow touch events to pass through to buttons

        // Add the overlay view behind the bottom sheet
        mainWindow.addSubview(overlayView)

        if let bottomSheetView = bottomSheetVC.view {
          // Configure the bottom sheet view's frame and other properties
          bottomSheetView.frame = CGRect(
            x: 0, y: mainWindow.bounds.height - bottomSheetHeight,
            width: bottomSheetWidth, height: bottomSheetHeight)
          bottomSheetView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
          bottomSheetVC.edgesForExtendedLayout = .bottom  // Ignore safe area at the bottom

          // Add the bottom sheet view to the mainWindow
          mainWindow.addSubview(bottomSheetView)
        }
      }

    #endif

    /**
	  * An Android implementation of the AlertDialog(android.app.AlertDialog) using
	  * swift-android repository
	  * It works only for Android explicitly
	  */

    #if os(Android)

      /*  let bottomSheet: LinearLayout = LinearLayout(Application.currentActivity)
    bottomSheet.orientation = LinearLayout.VERTICAL
    bottomSheet.setBackgroundColor(0xFFEEEEEE.toInt())

    let textView: TextView = TextView(Application.currentActivity)
    textView.text = "This is a Bottom Sheet"
    textView.gravity = Gravity.CENTER
    textView.textSize = 20

    bottomSheet.addView(textView)

    let layoutParams: LinearLayoutParams = LinearLayoutParams(
        LinearLayoutParams.MATCH_PARENT,
        LinearLayoutParams.WRAP_CONTENT
    )

    Application.currentActivity.addContentView(bottomSheet, layoutParams)
    */
    #endif

  }

  @objc func button1Action() {
    // Action for Button 1
    self.dismissBottomSheet()
    Navigation.go(.exercise, clearHistory: false)
  }

  @objc func button2Action() {
    self.dismissBottomSheet()
    Navigation.go(.exercisesCollection, clearHistory: false)
  }

  @objc func button3Action() {
    // Action for Button 3
    print("Button 3 was tapped")
  }

  @objc func button4Action() {
    self.dismissBottomSheet()
  }

  func dismissBottomSheet() {
    // Dismiss the bottom sheet by removing it from the main window's hierarchy
    if let mainWindow = UIApplication.shared.windows.first, let bottomSheetVC = self.bottomSheetVC,
      let bottomSheetView = bottomSheetVC.view
    {

      // Remove the overlay view from the mainWindow
      for subview in mainWindow.subviews {
        if subview.backgroundColor == UIColor.black.withAlphaComponent(0.5) {
          subview.removeFromSuperview()
        }
      }

      // Remove the bottomSheetView and set bottomSheetVC to nil
      bottomSheetView.removeFromSuperview()
      bottomSheetVC.removeFromParent()
      self.bottomSheetVC = nil

      // Restore the original background color of the page here if needed
      // For example:
      mainWindow.backgroundColor = .clear  // Set your desired background color
    }
  }

  @objc func doneButtonAction() {
    // Handle "Done" button action here (e.g., retrieve selected values from the UIPickerView)
  }

}
