import ScadeKit

#if os(iOS)
  import UIKit
#endif

#if os(Android)
  import Android
  import AndroidApp
  import AndroidContent
#endif


class ExercisePageAdapter: SCDLatticePageAdapter {

  var bottomSheetVC: UIViewController?
  var pickerView: UIPickerView?
  var repeatBottomSheetVC: UIViewController?
  var repeatPickerView: UIPickerView?
  // let repeatPickerHelper = RepeatPickerHelper()
  //static var exerciseRepeats: Int = 0

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    // self.repeatPickerView?.delegate = self.repeatPickerHelper
    //  self.repeatPickerView?.dataSource = self.repeatPickerHelper

    self.textbox.onTextChange.append(
      SCDWidgetsTextChangeEventHandler {
        ev in self.updateDoneButtonColor()
      })

    self.minsTextbox.onTextChange.append(
      SCDWidgetsTextChangeEventHandler {
        ev in self.updateDoneButtonColor()
      })

    self.secsTexbox.onTextChange.append(
      SCDWidgetsTextChangeEventHandler {
        ev in self.updateDoneButtonColor()
      })   
      

    // Inside the doneButton onClick closure
    self.doneButton.onClick { _ in

       let newExercise = ExercisesCollection(
        exerciseName: self.textbox.text,
        exerciseMins: Int(self.minsTextbox.text) ?? 0,
        exerciseSecs: Int(self.secsTexbox.text) ?? 0, exerciseRepeats: 5
      )
      
      ExerciseDataManager.shared.newExercise = newExercise
 
       self.navigateToCircuitsList {
            // Closure to be executed after navigation
            self.textbox.text = ""
            self.minsTextbox.text = ""
            self.secsTexbox.text = ""
        }
    
     /* if !self.textbox.text.isEmpty && !self.minsTextbox.text.isEmpty
        && !self.secsTexbox.text.isEmpty
      {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
        Navigation.go(.circuitsList, clearHistory: false)
       } 
        self.textbox.text = ""
        self.minsTextbox.text = ""
        self.secsTexbox.text = ""
      }*/
      
      //self.navigateToCircuitsList()

    }

    self.backButton.onClick { _ in
      Navigation.back()
    }

    self.button1.onClick { _ in
      print("not here")
      self.showUIBottomSheetController()
    }

    /*  self.button.onClick{ _ in
    	Navigation.go(.workoutsList, clearHistory: false)
    }*/

    self.checkbox.onClick { _ in
      if self.checkbox.checked == true {
        print("not here")
        self.showUIBottomSheetController()
      }
    }

    self.button.onClick { _ in
      self.showRepeatBottomSheetController()
    }

  }

  func showRepeatBottomSheetController() {
    #if os(iOS)
      self.repeatBottomSheetVC = UIViewController()
      let repeatPickerHelper = RepeatPickerHelper()

      // Get the device's height
      let deviceHeight = UIScreen.main.bounds.height

      // Calculate the bottom sheet height (40% of the device's height)
      let bottomSheetHeight = deviceHeight * 0.32  // 40% of the device's height

      // Customize the appearance of your bottom sheet
      let bottomSheetWidth = UIScreen.main.bounds.width

      repeatBottomSheetVC?.view.backgroundColor = .clear  // Set transparent background for the bottom sheet
      repeatBottomSheetVC?.view.clipsToBounds = true
      repeatBottomSheetVC?.view.layer.cornerRadius = 16  // Optional: Round corners for visual effect

      // Add UI elements to the bottom sheet (e.g., buttons)
      let buttonHeight: CGFloat = 56  // Set the height for each button

      let buttonWidth = bottomSheetWidth - 16  // Adjusted width for buttons with padding

      // Create a UIPickerView
      repeatPickerView = UIPickerView()
      repeatPickerView?.frame = CGRect(
        x: 8, y: 20, width: Int(bottomSheetWidth) - 16, height: 160)
      let maskPath = UIBezierPath(roundedRect: repeatPickerView!.bounds, cornerRadius: 14)
      let maskLayer = CAShapeLayer()
      maskLayer.path = maskPath.cgPath
      repeatPickerView?.layer.mask = maskLayer
      repeatPickerView?.delegate = repeatPickerHelper
      repeatPickerView?.dataSource = repeatPickerHelper
      repeatPickerView?.backgroundColor = .white  // Set the background color to white
      repeatBottomSheetVC?.view.addSubview(repeatPickerView!)

      // Reload components after setting delegate and data source
      repeatPickerView?.reloadAllComponents()

      // Create Button 4 with all corners rounded
      let cancelButton = UIButton(
        frame: CGRect(
          x: 8, y: 20 + Int(buttonHeight * 3), width: Int(buttonWidth),
          height: Int(buttonHeight)))
      let maskPath4 = UIBezierPath(roundedRect: cancelButton.bounds, cornerRadius: 14)
      let maskLayer4 = CAShapeLayer()
      maskLayer4.path = maskPath4.cgPath
      cancelButton.layer.mask = maskLayer4
      cancelButton.setTitle("Cancel", for: .normal)
      cancelButton.setTitleColor(.black, for: .normal)
      cancelButton.backgroundColor = .white
      cancelButton.titleLabel?.font = UIFont(name: "SFPro-Semibold", size: 17)
      cancelButton.layer.borderColor = UIColor.gray.cgColor
      cancelButton.layer.borderWidth = 1.0
      cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
      repeatBottomSheetVC?.view.addSubview(cancelButton)

      // Present the custom-sized bottom sheet with a darkened background
      if let mainWindow = UIApplication.shared.windows.first,
        let repeatBottomSheetVC = self.repeatBottomSheetVC
      {
        // Create a semi-transparent overlay view
        let overlayView = UIView(frame: mainWindow.bounds)
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5)  // Adjust alpha for the darkness level
        overlayView.isUserInteractionEnabled = false  // Allow touch events to pass through to buttons

        // Add the overlay view behind the bottom sheet
        mainWindow.addSubview(overlayView)

        if let repeatBottomSheetView = repeatBottomSheetVC.view {
          // Configure the bottom sheet view's frame and other properties
          repeatBottomSheetView.frame = CGRect(
            x: 0, y: mainWindow.bounds.height - bottomSheetHeight,
            width: bottomSheetWidth, height: bottomSheetHeight)
          repeatBottomSheetView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
          repeatBottomSheetVC.edgesForExtendedLayout = .bottom  // Ignore safe area at the bottom

          // Add the bottom sheet view to the mainWindow
          mainWindow.addSubview(repeatBottomSheetView)
        }
      }

    #endif

  }

  func showUIBottomSheetController() {
    #if os(iOS)

      // Create a UIViewController that will act as your bottom sheet
      self.bottomSheetVC = UIViewController()
      // Create an instance of ExercisePickerHelper
      let pickerHelper = ExercisePickerHelper()

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

      // Create a UIPickerView
      pickerView = UIPickerView()
      pickerView?.frame = CGRect(
        x: 8, y: 20, width: Int(bottomSheetWidth) - 16, height: 160)
      let maskPath = UIBezierPath(roundedRect: pickerView!.bounds, cornerRadius: 14)
      let maskLayer = CAShapeLayer()
      maskLayer.path = maskPath.cgPath
      pickerView?.layer.mask = maskLayer
      pickerView?.delegate = pickerHelper
      pickerView?.dataSource = pickerHelper
      pickerView?.backgroundColor = .white  // Set the background color to white
      bottomSheetVC?.view.addSubview(pickerView!)

      // Reload components after setting delegate and data source
      pickerView?.reloadAllComponents()

      // Create a "Done" button for UIPickerView
      /* let doneButton = UIButton(
        frame: CGRect(
          x: 8, y: 180, width: Int(bottomSheetWidth) - 16, height: Int(buttonHeight)))
      doneButton.setTitle("Done", for: .normal)
      doneButton.setTitleColor(.black, for: .normal)
      doneButton.backgroundColor = .white
      doneButton.titleLabel?.font = UIFont(name: "SFPro-Semibold", size: 17)
      doneButton.layer.borderColor = UIColor.gray.cgColor
      doneButton.layer.borderWidth = 0.1
      doneButton.addTarget(self, action: #selector(doneButtonAction), for: .touchUpInside)
      bottomSheetVC?.view.addSubview(doneButton)
     */
      // Create Button 4 with all corners rounded
      let button4 = UIButton(
        frame: CGRect(
          x: 8, y: 20 + Int(buttonHeight * 3), width: Int(buttonWidth),
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

  }

  @objc func doneButtonAction() {
    // Handle "Done" button action here (e.g., retrieve selected values from the UIPickerView)
  }

  @objc func button4Action() {
    self.dismissBottomSheet()
  }

  @objc func cancelButtonAction() {
    self.dismissRepeatBottomSheet()
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

  func dismissRepeatBottomSheet() {
    // Dismiss the bottom sheet by removing it from the main window's hierarchy
    if let mainWindow = UIApplication.shared.windows.first,
      let repeatBottomSheetVC = self.repeatBottomSheetVC,
      let repeatBottomSheetView = repeatBottomSheetVC.view
    {

      // Remove the overlay view from the mainWindow
      for subview in mainWindow.subviews {
        if subview.backgroundColor == UIColor.black.withAlphaComponent(0.5) {
          subview.removeFromSuperview()
        }
      }

      // Remove the bottomSheetView and set bottomSheetVC to nil
      repeatBottomSheetView.removeFromSuperview()
      repeatBottomSheetVC.removeFromParent()
      self.repeatBottomSheetVC = nil

      // Restore the original background color of the page here if needed
      // For example:
      mainWindow.backgroundColor = .clear  // Set your desired background color
    }
  }

  func setBackgroundColor(of control: SCDWidgetsWidget, to color: SCDGraphicsRGB) {
    control.backgroundColor = color
  }

  func configureFontStyle(of control: SCDWidgetsTextWidget, to color: SCDGraphicsRGB) {
    control.font!.color = color
  }

  func updateDoneButtonColor() {
    // Check if all three text boxes are non-empty
    if !self.textbox.text.isEmpty && !self.minsTextbox.text.isEmpty && !self.secsTexbox.text.isEmpty
    {
      self.doneButton.font!.color = blackColor
    } else {
      self.doneButton.font!.color = greyColor
    }
  }
   
    private func navigateToCircuitsList(completion: @escaping () -> Void) {
      if !self.textbox.text.isEmpty && !self.minsTextbox.text.isEmpty
        && !self.secsTexbox.text.isEmpty
      {
        DispatchQueue.main.async {
            Navigation.go(.circuitsList, clearHistory: false)
            completion()
            }
        }
    }

}

class ExercisePickerHelper: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 2  // Two components for minutes and seconds
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return 60  // 60 rows for each component (0-59)
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)
    -> String?
  {
    let value = String(format: "%02d", row)  // Display minutes or seconds with leading zeros

    if component == 0 {
      return "\(value) min"
    } else {
      return "\(value) sec"
    }
  }
}

class RepeatPickerHelper: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {

  var numberOfRepeats: [Int] = []

  override init() {
    super.init()
    // Initialize the number of repeats or load it from some source
    numberOfRepeats = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  }

  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return numberOfRepeats.count
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)
    -> String?
  {
    return String(numberOfRepeats[row])
  }

}

/*
// Conform to UIPickerViewDelegate and UIPickerViewDataSource
extension ExercisePageAdapter: UIPickerViewDelegate, UIPickerViewDataSource {
  // Implement required methods for UIPickerViewDelegate and UIPickerViewDataSource
  // For example:
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 2  // Assuming you want to select minutes and seconds separately
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    // Return the number of rows for each component (e.g., minutes and seconds)
    // Implement according to your requirements
    return 60  // For example, 60 minutes or seconds
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)
    -> String?
  {
    // Provide titles for rows in each component
    // Implement according to your requirements (e.g., show minutes and seconds)
    return "\(row)"
  }

  // Implement other delegate and data source methods as needed
}
*/
