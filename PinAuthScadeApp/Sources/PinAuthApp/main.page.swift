import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

  // colors
  let colorDefaultGreen = SCDGraphicsRGB(red: 211, green: 211, blue: 211, alpha: 255)
  let whiteColor = SCDGraphicsRGB(red: 255, green: 255, blue: 255, alpha: 255)

  // page adapter initialization
  //position initialization
  var position = 0
  var pinString = ""

  let secondPage: SecondpagePageAdapter = SecondpagePageAdapter()

  override func load(_ path: String) {
    super.load(path)

    // add gesture to button. Is changes the background color
    // of the button when button is pressed (began) and finger is lifted up (ended)
    self.b0.drawing!.gestureRecognizers.append(getUpDownGestureForButton(btn: self.b0, val: 0))
    self.b1.drawing!.gestureRecognizers.append(getUpDownGestureForButton(btn: self.b1, val: 1))
    self.b2.drawing!.gestureRecognizers.append(getUpDownGestureForButton(btn: self.b2, val: 2))
    self.b3.drawing!.gestureRecognizers.append(getUpDownGestureForButton(btn: self.b3, val: 3))
    self.b4.drawing!.gestureRecognizers.append(getUpDownGestureForButton(btn: self.b4, val: 4))
    self.b5.drawing!.gestureRecognizers.append(getUpDownGestureForButton(btn: self.b5, val: 5))
    self.b6.drawing!.gestureRecognizers.append(getUpDownGestureForButton(btn: self.b6, val: 6))
    self.b7.drawing!.gestureRecognizers.append(getUpDownGestureForButton(btn: self.b7, val: 7))
    self.b8.drawing!.gestureRecognizers.append(getUpDownGestureForButton(btn: self.b8, val: 8))
    self.b9.drawing!.gestureRecognizers.append(getUpDownGestureForButton(btn: self.b9, val: 9))
    self.b_cancel.drawing!.gestureRecognizers.append(
      getUpDownGestureForButton(btn: self.b_cancel, val: -1))

  }

  func updatePin(val: Int) {

    if val == -1 {
      if position == 1 {
        self.digit_1.text = "*"
        position -= 1
      } else if position == 2 {
        self.digit_2.text = "*"
        position -= 1
      } else if position == 3 {
        self.digit_3.text = "*"
        position -= 1
      } else if position == 4 {
        self.digit_4.text = "*"
        position -= 1
      } else if position == 5 {
        self.digit_5.text = "*"
        position -= 1
      }
    } else {
      position += 1
      if position == 1 {
        self.digit_1.text = String(val)

      } else if position == 2 {
        self.digit_2.text = String(val)

      } else if position == 3 {
        self.digit_3.text = String(val)

      } else if position == 4 {
        self.digit_4.text = String(val)

      } else if position == 5 {
        self.digit_5.text = String(val)
        pinString =
          "\(self.digit_1.text)\(self.digit_2.text)\(self.digit_3.text)\(self.digit_4.text)\(self.digit_5.text)"
        self.callFinalMethod(pin: pinString)

      } else {
        position = 5
        print("Exceeded")
      }
    }
  }

  func callFinalMethod(pin: String) {
    print("Final 5-digit pincode: \(pin)")

  }

  func getUpDownGestureForButton(btn: SCDWidgetsButton, val: Int) -> SCDSvgPanGestureRecognizer {

    // Create action*
    func onPanAction(recognizer: SCDSvgGestureRecognizer?) {

      // depending on whether we are inside or outside of the button,
      // we set the button background a different color
      switch recognizer!.state {
      case .began:
        btn.backgroundColor = self.colorDefaultGreen
        self.updatePin(val: val)
      case .ended:
        btn.backgroundColor = self.whiteColor
      default:
        return
      }
    }

    // create recognizer
    let panGestureRecognizer = SCDSvgPanGestureRecognizer(onPanAction)

    // Configure gesture --> nothing to configure. Return it
    return panGestureRecognizer

  }

}
