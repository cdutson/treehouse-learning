// Struct assignment
/*
Imagine that you are asked to build a todo app that keeps track of tasks. A task is broken down into the following:

Description
Status: Doing, Pending, Completing
The Description of the task describes what needs to get done. The Status on the other hand can and should have only 3 values: Doing, Pending, Completed. Your assignment is to model a Task struct which will have two properties description and status. However, here's the catch to use Status you will have to create your own enum
*/

import UIKit

struct Task {
    var description: String = ""
    var status = Status()
    
    init(desc: String) {
        self.description = desc
    }
}

enum Status {
    case Doing, Pending, Completed
    
    init() {
        self = .Pending
    }
}

var myTask = Task(desc: "Vroom")

myTask.description
myTask.status
myTask.status = .Completed
