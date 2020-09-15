	import ScadeKit
	
	class DogView : EObject {
			
		// please make sure you annotate each variable with the type
		// for SCADE to more identify and leverage the type information
		@objc dynamic var id : String
		@objc dynamic var name : String
		@objc dynamic var ageInYears : Int 
		@objc dynamic var breed:String 
		
		@objc dynamic var isGroup:Bool
		@objc dynamic var isDetail:Bool
		
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
