import ScadeKit


class WorkoutPageAdapter: SCDLatticePageAdapter {
   let circuitsListPageAdapter = CircuitsListPageAdapter.shared
  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    self.list.elementProvider = SCDWidgetsElementProvider {
      (workout: CircuitsCollection, element) in

      let totalExMins = workout.totalExerciseMins
      let totalExSecs = workout.totalExerciseSecs

      (element.getWidgetByName("exerciseNameTimeLabel") as! SCDWidgetsLabel).text =
        "\(workout.circuitName), \(String(format: "%02d:%02d", totalExMins, totalExSecs))"
      (element.getWidgetByName("repeatCountExerciseNumberLabel") as! SCDWidgetsLabel).text =
        "\(String(workout.exerciseNumInCircuit)) Exercises, \(String(workout.totalExerciseRepeatsInCircuit ?? 0))"
    }

    self.page?.onEnter.append(
      SCDWidgetsEnterEventHandler { [weak self] _ in
        if let newCircuit = CircuitDataManager.shared.newCircuit {
          // print("\(newExercise.exerciseMins) for CircuitLists page")
          self?.list.items.append(newCircuit)

          CircuitDataManager.shared.newCircuit = nil  // Reset to avoid duplications
          // self.list.reloadData() // Refresh the list
        }

      })

    self.textbox.onTextChange.append(

      SCDWidgetsTextChangeEventHandler {
        ev in self.updateDoneButtonColor()
      })

    self.doneButton.onClick { _ in

      // Create a new CircuitsCollection instance
      let newWorkout = WorkoutsCollection(
        workoutName: self.textbox.text, circuitsList: [], circuitNumInWorkout: self.list.items.count)

      // Iterate through each newCircuit and append it to the circuitsList
      for newCircuit in CircuitDataManager.shared.newCircuitList {
        newWorkout.circuitsList.append(newCircuit)
      }

      // Reset the shared newCircuitList to avoid duplications
      CircuitDataManager.shared.newCircuitList = []

      // Set the newWorkout to the shared newWorkout
      WorkoutDataManager.shared.newWorkout = newWorkout

      // Navigate to the WorkoutPage
      self.navigateToWorkoutPage {
        // Closure to be executed after navigation
        self.textbox.text = ""
      }
    }

    self.addWorkoutButton.onClick { _ in
      Navigation.go(.exercise, clearHistory: false)
    }

  }

  func updateDoneButtonColor() {
    // Check if all three text boxes are non-empty
    if !self.textbox.text.isEmpty && self.textbox.text.count >= 3 {
      self.doneButton.font!.color = blackColor
    } else {
      self.doneButton.font!.color = greyColor
    }
  }

  private func navigateToWorkoutPage(completion: @escaping () -> Void) {
    if !self.textbox.text.isEmpty {
      DispatchQueue.main.async {
        Navigation.go(.workoutsList, clearHistory: false)
        completion()
      }
    }
  }

}
