import ScadeKit

class Dog {
	
	// please make sure you annotate each variable with the type
	// for SCADE to more identify and leverage the type information
	var id : String
	var name : String
	var ageInYears : Int 
	var breed:String 
	
	init(id:String,name:String,breed:String,ageInYears:Int) {
		self.id = id
		self.name = name
		self.breed = breed
		self.ageInYears = ageInYears	
	}
}
