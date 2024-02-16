import ScadeKit

class TimersCollection: EObject {
	var id: Int64?
	var workInterval: Int
    var restInterval: Int
    var rounds: Int
    var timerName: String
    
    init(id: Int64? = nil, workInterval: Int, restInterval: Int, rounds: Int, timerName: String) {
      self.id = id
      self.workInterval = workInterval
      self.restInterval = restInterval
      self.rounds = rounds
      self.timerName = timerName
 } 
	
}