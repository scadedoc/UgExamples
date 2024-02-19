import ScadeKit

class IntervalTimerPageAdapter: SCDLatticePageAdapter {

  static var updatedSetLabel: Int = 1
  var workElapsedTime: Int = 0
  var restElapsedTime: Int = 0
  var isWorkingInterval = true
  var timeRemaining = 0
  var totalWorkInSecs: Int?
  var totalRestInSecs: Int?
  static var workTime: Int = 1
  static var restTime: Int = 1
  
  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
    self.setPlusButton.onClick { _ in
      IntervalTimerPageAdapter.updatedSetLabel += 1
      self.intervalLabel.text = String(IntervalTimerPageAdapter.updatedSetLabel)
    }

    self.setMinusButton.onClick { _ in
      if IntervalTimerPageAdapter.updatedSetLabel > 1 {
        IntervalTimerPageAdapter.updatedSetLabel -= 1
        self.intervalLabel.text = String(IntervalTimerPageAdapter.updatedSetLabel)
      }
    }

    self.workPlusButton.onClick { _ in
      self.workElapsedTime += 1

      // Calculate minutes and seconds
      let minutes = self.workElapsedTime / 60
      let seconds = self.workElapsedTime % 60

      // Update the label with the formatted time
      self.workTimeLabel.text = String(format: "%02d:%02d", minutes, seconds)

      // IntervalTimerPageAdapter.workTime = Int(self.workTimeLabel.text)

      // Convert workTimeLabel.text to Int
      let timeComponents = self.workTimeLabel.text.components(separatedBy: ":")
      if timeComponents.count == 2, let minutes = Int(timeComponents[0]),
        let seconds = Int(timeComponents[1])
      {
        _ = (minutes * 60) + seconds
        self.totalWorkInSecs = (minutes * 60) + seconds
        IntervalTimerPageAdapter.workTime = self.totalWorkInSecs!
      }
    }
    
    self.workMinusButton.onClick { _ in
      if self.workElapsedTime > 1 {
        self.workElapsedTime -= 1

        // Calculate minutes and seconds
        let minutes = self.workElapsedTime / 60
        let seconds = self.workElapsedTime % 60

        // self.workElapsedTime = 1
        // Update the label with the formatted time
        self.workTimeLabel.text = String(format: "%02d:%02d", minutes, seconds)

        //IntervalTimerPageAdapter.workTime = Int(self.workTimeLabel.text)!

        // Convert workTimeLabel.text to Int
        let timeComponents = self.workTimeLabel.text.components(separatedBy: ":")

        if timeComponents.count == 2, let minutes = Int(timeComponents[0]),
          let seconds = Int(timeComponents[1])
        {
          _ = (minutes * 60) + seconds
          self.totalWorkInSecs = (minutes * 60) + seconds
          IntervalTimerPageAdapter.workTime = self.totalWorkInSecs!
        }
      }
    }

    self.restPlusButton.onClick { _ in
      self.restElapsedTime += 1

      // Calculate minutes and seconds
      let minutes = self.restElapsedTime / 60
      let seconds = self.restElapsedTime % 60

      // Update the label with the formatted time
      self.restTimeLabel.text = String(format: "%02d:%02d", minutes, seconds)

      //IntervalTimerPageAdapter.restTime = Int(self.restTimeLabel.text)

      // Convert workTimeLabel.text to Int
      let timeComponents = self.restTimeLabel.text.components(separatedBy: ":")

      if timeComponents.count == 2, let minutes = Int(timeComponents[0]),
        let seconds = Int(timeComponents[1])
      {
        //let totalSeconds = (minutes * 60) + seconds
        self.totalRestInSecs = (minutes * 60) + seconds
        IntervalTimerPageAdapter.restTime = self.totalRestInSecs!
      }
    }

    self.restMinusButton.onClick { _ in
      if self.restElapsedTime > 1 {
        self.restElapsedTime -= 1

        // Calculate minutes and seconds
        let minutes = self.restElapsedTime / 60
        let seconds = self.restElapsedTime % 60

        // Update the label with the formatted time
        self.restTimeLabel.text = String(format: "%02d:%02d", minutes, seconds)

        //IntervalTimerPageAdapter.restTime = Int(self.restTimeLabel.text)

        // Convert workTimeLabel.text to Int
        let timeComponents = self.restTimeLabel.text.components(separatedBy: ":")

        if timeComponents.count == 2, let minutes = Int(timeComponents[0]),
          let seconds = Int(timeComponents[1])
        {
          // let totalSeconds = (minutes * 60) + seconds
          self.totalRestInSecs = (minutes * 60) + seconds
          IntervalTimerPageAdapter.restTime = self.totalRestInSecs!
        }
      }
    }

    self.startButton.onClick { _ in
      Navigation.go(.intervalTimerScreen, clearHistory: false)
    }

    self.toolBarItem1.onClick { _ in
      Navigation.go(.main, clearHistory: true)
    }
    
  }

}
