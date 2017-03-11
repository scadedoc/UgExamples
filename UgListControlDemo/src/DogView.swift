	import ScadeKit
	
	class DogView : EObject {
			
		// please make sure you annotate each variable with the type
		// for SCADE to more identify and leverage the type information
		let id : String
		let name : String
		let ageInYears : Int 
		let breed:String 
		
		let isGroup:Bool
		let isDetail:Bool
		
		init(id:String,name:String,breed:String,ageInYears:Int) {
			self.id = id
			self.name = name
			self.breed = breed
			self.ageInYears = ageInYears	
			self.isGroup = false
			self.isDetail = !self.isGroup
		}
		
		init(breed:String) {
			self.id = ""
			self.name = ""
			self.breed = breed
			self.ageInYears = -1	
			self.isGroup = true
			self.isDetail = !self.isGroup
		}
	}
