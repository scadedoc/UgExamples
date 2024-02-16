import Foundation
import SQLite
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

  var insertedTimerId: Int64 = 0

  var items: [TimersCollection] = []

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)
    // self.deleteExistingDatabase()
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

    self.list.elementProvider = SCDWidgetsElementProvider { (iTimer: TimersCollection, element) in

      (element.getWidgetByName("timerNameLabel") as! SCDWidgetsLabel).text = iTimer.timerName

      (element.getWidgetByName("label3") as! SCDWidgetsLabel).text = String(iTimer.rounds)

      let wMinutes = iTimer.workInterval / 60
      let wSeconds = iTimer.workInterval % 60
      (element.getWidgetByName("label5") as! SCDWidgetsLabel).text = String(
        format: "%02d:%02d", wMinutes, wSeconds)

      let rMinutes = iTimer.restInterval / 60
      let rSeconds = iTimer.restInterval % 60
      (element.getWidgetByName("label7") as! SCDWidgetsLabel).text = String(
        format: "%02d:%02d", rMinutes, rSeconds)

      (element.getWidgetByName("cancelButton") as! SCDWidgetsButton).onClick { _ in
        //self.list.items.remove(at: 0)
        //print("remove from list")
        print("insertedTimerId inside the CancelButton: \(self.insertedTimerId)")
        self.deleteFromDatabase(timerId: self.insertedTimerId)
        self.removeFromList(timerId: self.insertedTimerId)

        //self.list.reload()
      }

      /*  guard let rowView = element["rowView", as: SCDWidgetsRowView.self],
        let gridView = element["gridView", as: SCDWidgetsGridView.self]
      else { return }

      if let timerNameLabel = rowView["timerNameLabel", as: SCDWidgetsLabel] {
        timerNameLabel.text = iTimer.timerName
      }

      if let cancelButton = rowView["cancelButton", as: SCDWidgetsButton] {

      }

      if let label3 = gridView["label3", as: SCDWidgetsLabel] {
        label3.text = String(iTimer.rounds)
      }

      if let label5 = gridView["label5", as: SCDWidgetsLabel] {
        let minutes = iTimer.workInterval / 60
        let seconds = iTimer.workInterval % 60

        label5.text = String(format: "%02d:%02d", minutes, seconds)
      }

      if let label7 = gridView["label7", as: SCDWidgetsLabel] {

        let minutes = iTimer.restInterval / 60
        let seconds = iTimer.restInterval % 60

        label7.text = String(format: "%02d:%02d", minutes, seconds)
      }
      */

    }
 
    self.loadDataFromDatabase()

    self.removeAllButton.onClick { _ in
      self.clearDatabase()
      self.list.items.removeAll()
    }

    self.saveButton.onClick { _ in

      //  let newTimer = TimersCollection(
      //  workInterval: self.totalWorkInSecs!, restInterval: self.totalRestInSecs!,
      //  rounds: IntervalTimerPageAdapter.updatedSetLabel,
      //  timerName: SavingTimerScreenPageAdapter.timerName ?? "default name")

      //self.list.items.append(newTimer)

      do {

        let db = try Connection(NSHomeDirectory() + "/recent_database.db")

        print("Database path: \(db)")

        let timers = Table("timers")

        let id = Expression<Int64>("id")
        let workInterval = Expression<Int>("workInterval")
        let restInterval = Expression<Int>("restInterval")
        let rounds = Expression<Int>("rounds")
        let timerName = Expression<String>("timerName")
        //let insertionOrder = Expression<Int>("insertionOrder")  // Define insertionOrder Expression
        //let insertionTimeStamp = Expression<Date>("insertionTimeStamp") // assuming this is the column name

        // Check if the 'timers' table exists using COUNT(*)
        let count =
          try db.scalar(
            "SELECT COUNT(*) FROM sqlite_master WHERE type='table' AND name='timers';"
          ) as! Int64

        if count == 0 {
          // Table doesn't exist, create it
          try db.run(
            timers.create { table in
              table.column(id, primaryKey: true)
              table.column(workInterval)
              table.column(restInterval)
              table.column(rounds)
              table.column(timerName)
            })
        }

        // Create a TimersCollection instance with provided values
        let newTimer = TimersCollection(
          workInterval: self.totalWorkInSecs!, restInterval: self.totalRestInSecs!,
          rounds: IntervalTimerPageAdapter.updatedSetLabel,
          timerName: SavingTimerScreenPageAdapter.timerName ?? "default name"
        )

        // Insert the provided values into the 'timers' table
        let insert = timers.insert(
          workInterval <- newTimer.workInterval,
          restInterval <- newTimer.restInterval,
          rounds <- newTimer.rounds,
          timerName <- newTimer.timerName
        )
        let rowId = try db.run(insert)
        print("Database: \(rowId)")
        self.insertedTimerId = rowId

        newTimer.id = Int64(rowId)

        // Verify data existence by fetching and displaying contents
        for row in try db.prepare(timers) {
          print(
            "workInterval: \(row[workInterval]), restInterval: \(row[restInterval]), rounds: \(row[rounds]), timerName: \(row[timerName])"
          )
        }

        self.list.items = []

        // Retrieve data from the 'timers' table and sort by insertion time
        //let query = timers.order(insertionOrder)

        for row in try db.prepare(timers) {
          print("Loading data from database...")
          let retrievedTimer = TimersCollection(
            workInterval: row[workInterval],
            restInterval: row[restInterval],
            rounds: row[rounds],
            timerName: row[timerName]
          )

          // Perform actions with the retrieved data as needed
          // For example:
          self.list.items.append(retrievedTimer)
        }

      } catch {
        print("Error: \(error)")
      }

    }

    //self.list.separator?.stroke = SCDSvgRGBColor(red: 50, green: 52, blue: 65)

    list.onItemSelected.append(
      SCDWidgetsItemSelectedEventHandler { event in

        guard let selectedTimer = event?.item as? TimersCollection else { return }

        IntervalTimerPageAdapter.workTime = selectedTimer.workInterval

        IntervalTimerPageAdapter.restTime = selectedTimer.restInterval

        IntervalTimerPageAdapter.updatedSetLabel = selectedTimer.rounds

        Navigation.go(.intervalTimerScreen, clearHistory: false)

      })

    /*  list.onItemSelected{ event in

    guard let selectedTimer = event.item as? TimersCollection else {return}

    IntervalTimerPageAdapter.workTime = selectedTimer.workInterval
    IntervalTimerPageAdapter.restTime = selectedTimer.restInterval
    IntervalTimerPageAdapter.updatedSetLabel = selectedTimer.rounds

    Navigation.go(.intervalTimerScreen, clearHistory: false)

    }*/

  }

  /*func loadDataFromDatabase() {
    print("Loading data from database...")
    do {
      let db = try Connection(NSHomeDirectory() + "/database.db")
      let timers = Table("timers")

      let id = Expression<Int64>("id")
      let workInterval = Expression<Int>("workInterval")
      let restInterval = Expression<Int>("restInterval")
      let rounds = Expression<Int>("rounds")
      let timerName = Expression<String>("timerName")

      // Retrieve data from the 'timers' table and add it to the list
      for row in try db.prepare(timers) {
        let retrievedTimer = TimersCollection(
          workInterval: row[workInterval],
          restInterval: row[restInterval],
          rounds: row[rounds],
          timerName: row[timerName]
        )
          self.list.items.append(retrievedTimer)
      }
    } catch {
      print("Error loading data: \(error)")
    }
  }*/

  func loadDataFromDatabase() {
    print("Loading data from database...")
    do {
      let db = try Connection(NSHomeDirectory() + "/recent_database.db")
      let timers = Table("timers")

      let id = Expression<Int64>("id")
      let workInterval = Expression<Int>("workInterval")
      let restInterval = Expression<Int>("restInterval")
      let rounds = Expression<Int>("rounds")
      let timerName = Expression<String>("timerName")
      //let insertionOrder = Expression<Int>("insertionOrder")  // Define insertionOrder Expression
      //let insertionTimeStamp = Expression<Date>("insertionTimeStamp") // assuming this is the column name

      // Retrieve data from the 'timers' table and add it to the list

      //let query = timers.order(insertionOrder)

      for row in try db.prepare(timers) {
        let retrievedTimer = TimersCollection(
          workInterval: row[workInterval],
          restInterval: row[restInterval],
          rounds: row[rounds],
          timerName: row[timerName]
        )

        DispatchQueue.global().async {
          DispatchQueue.main.async {
            self.items.append(retrievedTimer)
            //self.list.items.append(retrievedTimer)
            self.list.items = self.items
          }
        }
      }
    } catch let error as SQLite.Result {
      print("SQLite error: \(error.localizedDescription)")
      // Handle SQLite specific errors
    } catch let error {
      print("Error loading data: \(error.localizedDescription)")
      // Handle other errors
    }
  }

  func deleteFromDatabase(timerId: Int64) {
    do {
      let db = try Connection(NSHomeDirectory() + "/recent_database.db")
      let timers = Table("timers")
      let id = Expression<Int64>("id")

      let timerToDelete = timers.filter(id == timerId)
      try db.run(timerToDelete.delete())
    } catch {
      print("Error deleting data: \(error)")
    }
  }

  func removeFromList(timerId: Int64) {
    if let index = self.list.items.firstIndex(where: { ($0 as? TimersCollection)?.id == timerId }) {
      self.list.items.remove(at: index)
    }
  }

  func clearDatabase() {
    do {
      let db = try Connection(NSHomeDirectory() + "/recent_database.db")
      let timers = Table("timers")

      // Delete all rows from the 'timers' table
      try db.run(timers.delete())

      print("Database cleared")
    } catch {
      print("Error clearing database: \(error)")
    }
  }

  func deleteExistingDatabase() {
    let fileManager = FileManager.default
    do {
      let documentsURL = try fileManager.url(
        for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
      let databaseURL = documentsURL.appendingPathComponent("database.db")

      if fileManager.fileExists(atPath: databaseURL.path) {
        try fileManager.removeItem(at: databaseURL)
        print("Existing database deleted.")
      } else {
        print("Database file doesn't exist.")
      }
    } catch {
      print("Error deleting existing database: \(error)")
    }
  }

}
