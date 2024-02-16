import ScadeKit


class WorkoutsListPageAdapter: SCDLatticePageAdapter {

   var onWorkoutSelected: ((WorkoutsCollection) -> Void)?

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    self.list.elementProvider = SCDWidgetsElementProvider {
      (circuitData: WorkoutsCollection, listElement) in

      guard let gridView = listElement.getWidgetByName("gridView") as? SCDWidgetsGridView else {
        return
      }

      guard let rowView1 = gridView.getWidgetByName("rowView1") as? SCDWidgetsRowView else {
        return
      }
      print("\(listElement.children) for WorkList")
      guard
        let workoutTitleLabel = rowView1.getWidgetByName("workoutTitleLabel") as? SCDWidgetsLabel
      else { return }

      workoutTitleLabel.text = circuitData.workoutName

      guard let rowView3 = rowView1.getWidgetByName("rowView3") as? SCDWidgetsRowView else {
        return
      }

      guard
        let workoutStartButton = rowView3.getWidgetByName("workoutStartButton") as? SCDWidgetsButton
      else { return }
      workoutStartButton.onClick { _ in
        Navigation.go(.workoutScreen, clearHistory: false)
      }

      guard let rowView2 = gridView.getWidgetByName("rowView2") as? SCDWidgetsRowView else {
        return
      }
      guard let label5 = rowView2.getWidgetByName("label5") as? SCDWidgetsLabel else { return }
      label5.text = "\(circuitData.circuitsList.count) Circuits"
      guard let arrowDownButton = rowView2.getWidgetByName("arrowDownButton") as? SCDWidgetsButton
      else { return }
      //guard let arrowDownButton = listElement.getWidgetByName("arrowDownButton") as? SCDWidgetsButton else {return}

      guard let listView = listElement.getWidgetByName("listView") as? SCDWidgetsListView else {
        return
      }
      guard let gridView1 = listView.getWidgetByName("gridView1") as? SCDWidgetsGridView else {
        return
      }
      guard let listView2 = gridView1.getWidgetByName("listView2") as? SCDWidgetsListView else {
        return
      }

      (listView.layout as? SCDLayoutGridLayout)?.rows = circuitData.circuitsList.count
      //Int(circuitData.totalNumCircuitsInWorkout) ?? 3
      //let circuitsCount = Int(circuitData.totalNumCircuitsInWorkout) ?? 3

      var circuitsViewList: [SCDWidgetsGridView] = [gridView1]

      for _ in 1..<circuitData.circuitsList.count {
        circuitsViewList.append(gridView1.copyControl() as! SCDWidgetsGridView)
      }

      for (index, exercise) in circuitData.circuitsList.enumerated() {
        let exerciseView = circuitsViewList[index]

        (exerciseView.layoutData as? SCDLayoutGridData)?.row = index
        exerciseView.visible = true

        /*  if let label4 = exerciseView["label4", as: SCDWidgetsLabel.self]{
        	label4.text = "\(circuitData.circuitList.circuitName)"
        }*/

        guard var button1 = exerciseView.getWidgetByName("button1") as? SCDWidgetsButton else {
          return
        }

        guard let label4 = exerciseView.getWidgetByName("label4") as? SCDWidgetsLabel else {
          return
        }

        label4.text =
          "\(exercise.circuitName), \(String(format: "%02d:%02d", exercise.totalExerciseMins, exercise.totalExerciseSecs))"

        /* if let label6 = exerciseView["label6", as: SCDWidgetsLabel.self]{
        	label6.text = "\(circuitData.circuitList.circuitDescription)"
        }*/

        guard let label6 = exerciseView.getWidgetByName("label6") as? SCDWidgetsLabel else {
          return
        }

        //label6.text = "\(circuitData.circuitList[0].acircuitDescription)"
        label6.text =
          "\(String(exercise.exerciseNumInCircuit)) Exercises, \(String(exercise.totalExerciseRepeatsInCircuit ?? 0))"

      }

      listView.children = circuitsViewList

      arrowDownButton.onClick.append(
        SCDWidgetsEventHandler { _ in
          if listView.visible == true {
            listView.visible = false

          } else {
            listView.visible = true
          }
        }
      )

    }

    self.page?.onEnter.append(
      SCDWidgetsEnterEventHandler { [weak self] _ in
        if let newWorkout = WorkoutDataManager.shared.newWorkout {
          // print("\(newExercise.exerciseMins) for CircuitLists page")
          self?.list.items.append(newWorkout)

          WorkoutDataManager.shared.newWorkout = nil  // Reset to avoid duplications
          // self.list.reloadData() // Refresh the list
        }

      })

    list.onItemSelected.append(
      SCDWidgetsItemSelectedEventHandler { event in

        guard let selectedWorkout = event?.item as? WorkoutsCollection else { return }

        let numberOfExercises = selectedWorkout.circuitsList
          .flatMap { $0.exercisesList }
          .count
        print("\(numberOfExercises) exercises when an item is selected in the WorkoutsList")

        for circuit in selectedWorkout.circuitsList {
          for exercise in circuit.exercisesList {
            print("Exercise Name: \(exercise.exerciseName)")
          }
        }
        
        self.onWorkoutSelected?(selectedWorkout)
        
       // print("\(self.o)")
        
        Navigation.go(.workoutScreen, clearHistory: false)

      })

  }

}
