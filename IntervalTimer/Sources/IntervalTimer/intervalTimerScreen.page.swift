import Foundation
import ScadeKit

class IntervalTimerScreenPageAdapter: SCDLatticePageAdapter {
  var timer: Timer?
  var isWorkingInterval = true
  var timeRemaining = 0
  var workInterval = 0
  var restInterval = 0
  var remainingRounds = 0  // Set the desired number of rounds
  var preparationTimer: Timer?
  var preparationTime = 3

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
    self.remainingRounds = IntervalTimerPageAdapter.updatedSetLabel
    self.intervalLabel.text = "\(self.remainingRounds)"
    if self.preparationTimer == nil && self.timer == nil {
      
      //self.preparationTimer?.invalidate()
      //  self.preparationTimer = nil
      //  self.timer?.invalidate()
      //  self.timer = nil
      
      self.startPreparationTimer()
      
    } else {
      self.stopTimer()
    }
    self.backButton.onClick { _ in
    //self.stopTimer()
    Navigation.back()
     // if self.remainingRounds == 0 {
      //  self.stopTimer()
      //  self.workInterval = IntervalTimerPageAdapter.workTime
      //  self.restInterval = IntervalTimerPageAdapter.restTime
       // self.remainingRounds = IntervalTimerPageAdapter.updatedSetLabel
       // self.intervalLabel.text = "\(self.remainingRounds)"
       // Navigation.back()
     // }
    }
    
    self.resetButton.onClick{ _ in
    self.resetTapping()
  //  if self.remainingRounds == 0 {
  //  	self.resetTapping()
  //  	Navigation.go(.intervalTimer, clearHistory: true)
  //  }
    	//self.resetTimer()
    	//self.reseting()
    	//self.resetTapping()
    	//Navigation.go(.intervalTimer, clearHistory: true)
    }
  }

  func startPreparationTimer() {
    self.page?.backgroundColor = prepareColor
    self.preparationTime = 3  // Set the desired preparation time
    self.preparationTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
      [weak self] _ in
      self?.preparationTimerTick()
    }
    self.intervalLabel.text = ""  // Set intervalLabel to empty during preparation
    self.timerKindLabel.text = "PREPARE"  // Set timerKindLabel during preparation
    self.timerLabel.text = "\(self.preparationTime)"
  }

  func preparationTimerTick() {
    _ = self.preparationTime / 60
    _ = self.preparationTime % 60
    self.preparationTime -= 1
    self.timerLabel.text = "\(self.preparationTime)"

    if self.preparationTime <= 0 {
      self.preparationTimer?.invalidate()
      self.preparationTimer = nil
      self.intervalLabel.text = "\(self.remainingRounds)"  // Set intervalLabel to empty before starting the main interval timer
      self.timerKindLabel.text = isWorkingInterval ? "Work" : "Rest"  // Reset intervalLabel for the main interval timer
      self.startTimer()
    }
  }

  func startTimer() {

    self.workInterval = IntervalTimerPageAdapter.workTime
    self.restInterval = IntervalTimerPageAdapter.restTime
    timeRemaining = isWorkingInterval ? workInterval : restInterval
    updateLabels()
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
      self?.timerTick()
    }
    //self.startButton.text = "STOP"
    // }
  }

  func stopTimer() {
    self.preparationTimer?.invalidate()
    self.preparationTimer = nil
    self.timer?.invalidate()
    self.timer = nil
  }

  func timerTick() {
    self.timeRemaining -= 1
    if self.timeRemaining <= 0 {
      self.isWorkingInterval.toggle()
      self.timeRemaining = self.isWorkingInterval ? self.workInterval : self.restInterval
      self.updateLabels()

      //if isWorkingInterval && timeRemaining == workInterval {
      // This IF Statement is also the same as the one below.
      //  }

      if isWorkingInterval {
        if remainingRounds > 0 {
          remainingRounds -= 1
          self.intervalLabel.text = "\(remainingRounds)"
        }

        if remainingRounds == 0 {
          stopTimer()
          self.intervalLabel.text = ""
        }
      }
      
    }
    self.updateLabels()
  }

  func updateLabels() {
    self.page?.backgroundColor = self.isWorkingInterval ? workColor : restColor
    let minutes = self.timeRemaining / 60
    let seconds = self.timeRemaining % 60
    self.timerKindLabel.text = self.isWorkingInterval ? "WORK" : "REST"
    //self.timerLabel.text = "\(self.timeRemaining)"
    self.timerLabel.text = String(format: "%02d:%02d", minutes, seconds)

    if self.remainingRounds == 0 {
      self.timerKindLabel.text = ""
      self.configureFontStyle(of: self.timerLabel, off: whiteColor)
      self.timerLabel.text = "Completed!"
    }
    
  }

  func timerLabelInitialValue() {
    self.workInterval = IntervalTimerPageAdapter.workTime
    let minutes = self.workInterval / 60
    let seconds = self.workInterval % 60
    self.timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
  }

  func configureFontStyle(of control: SCDWidgetsTextWidget, off color: SCDGraphicsRGB) {
    control.font!.fontFamily = "Arial"
    control.font!.color = color
    control.font!.size = 55
  }
  
  func resetTapping(){
  	//if self.preparationTimer == nil && self.timer == nil {
        // Both timers are nil, implying completion
        self.preparationTimer?.invalidate()
        self.preparationTimer = nil
        self.timer?.invalidate()
        self.timer = nil
        
        // Reset necessary properties
        //self.remainingRounds = IntervalTimerPageAdapter.updatedSetLabel
        //self.intervalLabel.text = "\(remainingRounds)"
        //isWorkingInterval = true

        //self.preparationTime = 5 // Set the desired preparation time
        startPreparationTimer()
   // }
  }

}