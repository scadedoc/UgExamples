import ScadeKit
import SQLite
import Foundation

class MainPageAdapter: SCDLatticePageAdapter {

	var label : String = ""
	
	// page adapter initialization
	override func load(_ path: String) {		
		super.load(path)
		
		do {
			let db = try Connection(NSHomeDirectory() + "/data.db")
	
			let users = Table("users")
			let id = Expression<Int64>("id")
			let name = Expression<String?>("name")
			let email = Expression<String>("email")
			
			// ignore potentical exception
			_  = try? db.run(users.create { t in
			    t.column(id, primaryKey: true)
			    t.column(name)
			    t.column(email, unique: true)
			})
			// CREATE TABLE "users" (
			//     "id" INTEGER PRIMARY KEY NOT NULL,
			//     "name" TEXT,
			//     "email" TEXT NOT NULL UNIQUE
			// )
			
			let insert = users.insert(name <- "Alice", email <- "alice@mac.com")
			let rowid = try db.run(insert)
			// INSERT INTO "users" ("name", "email") VALUES ('Alice', 'alice@mac.com')
			
			for user in try db.prepare(users) {
			    print("id: \(user[id]), name: \(user[name]), email: \(user[email])")
			    
			    self.label = "Hello " + ( user[name]  ?? "User not found")
			    let label1 = self.page!.getWidgetByName("label1") as! SCDWidgetsLabel
			    label1.text = self.label
			    
			    // id: 1, name: Optional("Alice"), email: alice@mac.com
			}
			// SELECT * FROM "users"
			
			let alice = users.filter(id == rowid)
			
			try db.run(alice.update(email <- email.replace("mac.com", with: "me.com")))
			// UPDATE "users" SET "email" = replace("email", 'mac.com', 'me.com')
			// WHERE ("id" = 1)
			
			try db.run(alice.delete())
			// DELETE FROM "users" WHERE ("id" = 1)
			
			try db.scalar(users.count) // 0
			// SELECT count(*) FROM "users"
			
			}
		catch {
			print("ERROR: \(error)")
		}
		
	}


}
