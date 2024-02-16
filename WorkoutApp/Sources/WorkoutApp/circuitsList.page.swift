import ScadeKit

class CircuitsListPageAdapter: SCDLatticePageAdapter {

  static let shared = CircuitsListPageAdapter()

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    /* self.button2.onClick { _ in
      Navigation.go(.workoutsList, clearHistory: false)
    }*/

    self.list.elementProvider = SCDWidgetsElementProvider {
      (circuit: ExercisesCollection, element) in

      let exMins = circuit.exerciseMins
      let exSecs = circuit.exerciseSecs

      (element.getWidgetByName("exerciseData") as! SCDWidgetsLabel).text =
        "\(circuit.exerciseName), \(String(format: "%02d:%02d", exMins, exSecs))"
      (element.getWidgetByName("repeatCountLabel") as! SCDWidgetsLabel).text = String(
        circuit.exerciseRepeats ?? 0)

    }

    self.page?.onEnter.append(
      SCDWidgetsEnterEventHandler { [weak self] _ in
        if let newExercise = ExerciseDataManager.shared.newExercise {
          print("\(newExercise.exerciseMins) for CircuitLists page")
          self?.list.items.append(newExercise)
          ExerciseDataManager.shared.newExercise = nil  // Reset to avoid duplications
          // self.list.reloadData() // Refresh the list
        }

      })

    self.addCircuitButton.onClick { _ in
      Navigation.go(.exercise, clearHistory: false)
    }

    self.textbox.onTextChange.append(
      SCDWidgetsTextChangeEventHandler {
        ev in self.updateDoneButtonColor()
      })

    self.doneButton.onClick { _ in
      // Assuming self?.list.items is an array of ExercisesCollection
      let totalExerciseMins =
        (self.list.items as? [ExercisesCollection])?
        .compactMap { $0.exerciseMins }
        .reduce(0, +) ?? 0

      let totalExerciseSecs =
        (self.list.items as? [ExercisesCollection])?
        .compactMap { $0.exerciseSecs }
        .reduce(0, +) ?? 0
        
        
       // let newCircuit = CircuitsCollection(
      //  circuitName: self.textbox.text, totalExerciseMins: totalExerciseMins,
       // totalExerciseSecs: totalExerciseSecs, totalExerciseRepeatsInCircuit: 10,
      //  exerciseNumInCircuit: self.list.items.count, exercisesList: self.list.items)
          
     //  CircuitDataManager.shared.newCircuit = newCircuit
     //  CircuitDataManager.shared.newCircuitList.append(newCircuit)

      // Assuming self.list.items is an array of Any
      if let exercises = self.list.items as? [ExercisesCollection] {
        let newCircuit = CircuitsCollection(
          circuitName: self.textbox.text,
          totalExerciseMins: totalExerciseMins,
          totalExerciseSecs: totalExerciseSecs,
          totalExerciseRepeatsInCircuit: 10,
          exerciseNumInCircuit: exercises.count,
          exercisesList: exercises
        )
        
        CircuitDataManager.shared.newCircuit = newCircuit
      CircuitDataManager.shared.newCircuitList.append(newCircuit)
      } else {
        // Handle the case where conversion is not possible or handle the mismatch accordingly
        print("Error: Unable to convert self.list.items to [ExercisesCollection]")
      }

      

      self.navigateToWorkoutPage {
        // Closure to be executed after navigation
        self.textbox.text = ""
      }

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
        Navigation.go(.workout, clearHistory: false)
        completion()
      }
    }
  }

}
