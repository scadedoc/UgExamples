import ScadeKit

class DispatchExample {
	
	func run() {
		
		// Example 1 : run tasks in background
		DispatchQueue.global(qos: .background).async {
			print("Example 1 background job: \(Thread.current)")
		}
		
		// run tasks in background with delay
		let inTwoSeconds = DispatchTime.now() + .seconds(2)
		
		DispatchQueue.global(qos: .background).asyncAfter(deadline: inTwoSeconds) {
			print("Example 2 : running this after two seconds : background: \(Thread.current)")
		}
		
		// This is a common pattern to display results of an background job
		DispatchQueue.global(qos: .background).async {
   				 // do your long running background job here
				 print("Example 3 : running long running iO job  : background: \(Thread.current)")
				 
   			 DispatchQueue.main.async {
   			 print("Example 3: updating UI here: \(Thread.current)")
   	    	 // then update your UI here
   	    	}
		}
		
		// Example 4: Cancel a tasks after some time.
		// Create task that runs for long time
		var myWorkItem : DispatchWorkItem?
		myWorkItem = DispatchWorkItem {
	    	for i in 1...5 {
		        guard let item = myWorkItem, !item.isCancelled else {
		            print("Example 4 : workitem was canceled")
		            break
	       		 }
		         // wait one second
	      		 sleep(1)
	       		 print("Example 4: waiting \(i)")
    		}
		}

		// inform when workitem is done
		myWorkItem?.notify(queue: .main) {
		    print("Example 4 : I am done with my job")
		}

		// start workitem and cancel later
		let cancelAfter = DispatchTime.now() + .seconds(2)
		DispatchQueue.global().asyncAfter(deadline: cancelAfter) {
		    myWorkItem?.cancel()
		}
		
		// Run workitem
		DispatchQueue.main.async(execute: myWorkItem!)
	
	}
}
