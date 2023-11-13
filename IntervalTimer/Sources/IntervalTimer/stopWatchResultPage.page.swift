import ScadeKit
import Foundation

class StopWatchResultPagePageAdapter: SCDLatticePageAdapter {

  var hours: Int = 0
  var mins: Int = 0
  var secs: Int = 0

  //static let shared = StopWatchResultPagePageAdapter()

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    self.backButton.onClick { _ in
      Navigation.back()
    } 
    
    self.toolBarItem1.onClick { _ in
      Navigation.go(.main, clearHistory: true)
    }

    completionHandler = { [weak self] name, date in
      DispatchQueue.main.async {
        self?.didCreateEvent(name: name, targetDate: date)
      }
    }

  }

  private func didCreateEvent(name: String, targetDate: Date) {
    self.titleLabel.text = name
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

  private func startTimer() {
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

  private func updateLabel() {
    self.stopwatchLabel.text = "\(hours):\(mins):\(secs)"
  }
}
