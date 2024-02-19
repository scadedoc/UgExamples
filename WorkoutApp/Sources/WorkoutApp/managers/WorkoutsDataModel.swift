import ScadeKit

class ExercisesCollection: EObject {
  var exerciseName: String
  var exerciseMins: Int
  var exerciseSecs: Int
  var exerciseRepeats: Int?

  init(exerciseName: String, exerciseMins: Int, exerciseSecs: Int, exerciseRepeats: Int? = nil) {
    self.exerciseMins = exerciseMins
    self.exerciseSecs = exerciseSecs
    self.exerciseName = exerciseName
    self.exerciseRepeats = exerciseRepeats
  }
}

class CircuitsCollection: EObject {
  var circuitName: String
  var totalExerciseMins: Int
  var totalExerciseSecs: Int
  var totalExerciseRepeatsInCircuit: Int?
  var exerciseNumInCircuit: Int
  var exercisesList: [ExercisesCollection]

  init(
    circuitName: String, totalExerciseMins: Int, totalExerciseSecs: Int,
    totalExerciseRepeatsInCircuit: Int? = nil, exerciseNumInCircuit: Int,
    exercisesList: [ExercisesCollection]
  ) {
    self.circuitName = circuitName
    self.totalExerciseMins = totalExerciseMins
    self.totalExerciseSecs = totalExerciseSecs
    self.totalExerciseRepeatsInCircuit = totalExerciseRepeatsInCircuit
    self.exerciseNumInCircuit = exerciseNumInCircuit
    self.exercisesList = exercisesList
  }
}

class WorkoutsCollection: EObject {

  var workoutName: String
  var circuitsList: [CircuitsCollection]
  var circuitNumInWorkout: Int
  //var exerciseNumInCircuit: Int

  init(workoutName: String, circuitsList: [CircuitsCollection], circuitNumInWorkout: Int) {
    self.workoutName = workoutName
    self.circuitsList = circuitsList
    self.circuitNumInWorkout = circuitNumInWorkout

    // self.exerciseNumInCircuit = exerciseNumInCircuit
  }

}

class ExerciseDataManager {
  static let shared = ExerciseDataManager()
  private init() {}

  var newExercise: ExercisesCollection?
}

class CircuitDataManager {
  static let shared = CircuitDataManager()
  private init() {}

  var newCircuit: CircuitsCollection?
  var newCircuitList: [CircuitsCollection] = []
}

class WorkoutDataManager {
  static let shared = WorkoutDataManager()
  private init() {}

  var newWorkout: WorkoutsCollection?
}
