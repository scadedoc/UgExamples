import ScadeKit

class Dog : EObject {
	
	// please make sure you annotate each variable with the type
	// for SCADE to more identify and leverage the type information
	let id : String
	let name : String
	let ageInYears : Int 
	let breed:String 
	
	init(id:String,name:String,breed:String,ageInYears:Int) {
		self.id = id
		self.name = name
		self.breed = breed
		self.ageInYears = ageInYears	
	}
}
