import ScadeKit

class StopWatchResult: EObject {
/*
  static let shared = StopWatchResult()

  var hours: Int = 0
  var mins: Int = 0
  var secs: Int = 0

  func didCreateEvent(name: String, targetDate: Date) {
    // Trying to assign value to the eventLabel element of the List-Control
    CountDownListPageAdapter.shared.list.eventLabel.text = name
    let difference = floor(targetDate.timeIntervalSince(Date()))
    if difference > 0.0 {
      let computedHours: Int = Int(difference) / 3600
      let remainder: Int = Int(difference) - (computedHours * 3600)
      let minutes: Int = remainder / 60
      let seconds: Int = Int(difference) - (computedHours * 3600) - (minutes * 60)

      print("\(computedHours) \(minutes) \(seconds)")
      hours = computedHours
      mins = minutes
      secs = seconds

      updateLabel()

      startTimer()
    } else {
      print("negative interval")
    }
  }

  func startTimer() {
    Timer.scheduledTimer(
      withTimeInterval: 1.0, repeats: true,
      block: { _ in
        if self.secs > 0 {
          self.secs = self.secs - 1
        } else if self.mins > 0 && self.secs == 0 {
          self.mins = self.mins - 1
          self.secs = 59
        } else if self.hours > 0 && self.mins == 0 && self.secs == 0 {
          self.hours = self.hours - 1
          self.mins = 59
          self.secs = 59
        }

        self.updateLabel()
      })
  }

  func updateLabel() {
    // Trying to assign value to the label1 element of the List-Control
    CountDownListPageAdapter.shared.list.label1.text = "\(hours):\(mins):\(secs)"
  }
*/
}
