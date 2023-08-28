import Foundation
import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {
  var timerCounting: Bool = false
  var startTime: Date?
  var stopTime: Date?
  var color: SCDGraphicsRGB!

  let userDefaults = UserDefaults.standard

  let START_TIME_KEY = "startTime"
  let STOP_TIME_KEY = "stopTime"
  let COUNTING_KEY = "countingKey"

  var scheduledTimer: Timer!

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    self.toolBarItem2.onClick { _ in
      Navigation.go(.countDownList, clearHistory: true)
    }

    startTime = userDefaults.object(forKey: self.START_TIME_KEY) as? Date
    stopTime = userDefaults.object(forKey: self.STOP_TIME_KEY) as? Date
    timerCounting = userDefaults.bool(forKey: self.COUNTING_KEY)

    if timerCounting {
      self.startTimer()
    } else {
      self.stopTimer()
      if let start = self.startTime {
        if let stop = self.stopTime {
          let time = self.calcRestartTime(start: start, stop: stop)
          let diff = Date().timeIntervalSince(time)
          self.setTimeLabel(Int(diff))
        }
      }
    }

    self.resetButton.onClick { _ in
      self.setStopTime(date: nil)
      self.setStartTime(date: nil)
      self.timerLabel.text = self.makeTimeString(hour: 0, min: 0, sec: 0)
      self.stopTimer()
      self.startButton.text = "START"
    self.configureFontStyle(of: self.startButton, off: blueColor)
    }

    self.startButton.onClick { _ in
      if self.timerCounting {
        self.setStopTime(date: Date())
        self.stopTimer()
      } else {
        if let stop = self.stopTime {
          let restartTime = self.calcRestartTime(start: self.startTime!, stop: stop)
          self.setStopTime(date: nil)
          self.setStartTime(date: restartTime)
        } else {
          self.setStartTime(date: Date())
        }

        self.startTimer()
      }
    }

  }

  func calcRestartTime(start: Date, stop: Date) -> Date {
    let diff = start.timeIntervalSince(stop)
    return Date().addingTimeInterval(diff)
  }

  func startTimer() {
    scheduledTimer = Timer.scheduledTimer(
      timeInterval: 0.1, target: self, selector: #selector(refreshValue), userInfo: nil,
      repeats: true)
    setTimerCounting(true)
    self.startButton.text = "STOP"
    configureFontStyle(of: self.startButton, off: redColor)
  }

  func configureFontStyle(of control: SCDWidgetsTextWidget, off color: SCDGraphicsRGB) {
    control.font!.fontFamily = "Arial"
    control.font!.color = color
    control.font!.size = 20
  }

  @objc func refreshValue() {
    if let start = startTime {
      let diff = Date().timeIntervalSince(start)
      setTimeLabel(Int(diff))
    } else {
      stopTimer()
      setTimeLabel(0)
    }
  }

  func setTimeLabel(_ val: Int) {
    let time = secondsToHoursMinutesSeconds(val)
    let timeString = makeTimeString(hour: time.0, min: time.1, sec: time.2)
    self.timerLabel.text = timeString
  }

  func secondsToHoursMinutesSeconds(_ ms: Int) -> (Int, Int, Int) {
    let hour = ms / 3600
    let min = (ms % 3600) / 60
    let sec = (ms % 3600) % 60
    return (hour, min, sec)
  }

  func makeTimeString(hour: Int, min: Int, sec: Int) -> String {
    var timeString = ""
    timeString += String(format: "%02d", hour)
    timeString += ":"
    timeString += String(format: "%02d", min)
    timeString += ":"
    timeString += String(format: "%02d", sec)
    return timeString
  }

  func stopTimer() {
    if scheduledTimer != nil {
      scheduledTimer.invalidate()
    }
    setTimerCounting(false)
  }

  func setStartTime(date: Date?) {
    startTime = date
    userDefaults.set(startTime, forKey: START_TIME_KEY)
  }

  func setStopTime(date: Date?) {
    stopTime = date
    userDefaults.set(stopTime, forKey: STOP_TIME_KEY)
  }

  func setTimerCounting(_ val: Bool) {
    timerCounting = val
    userDefaults.set(timerCounting, forKey: COUNTING_KEY)
  }

}
