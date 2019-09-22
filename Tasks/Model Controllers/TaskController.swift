//
//  TaskController.swift
//  Tasks
//
//  Created by Spencer Curtis on 9/16/19.
//  Copyright © 2019 Andrew R Madsen. All rights reserved.
//

import Foundation

class TaskController {
    
    @discardableResult func createTaskList(with name: String) -> TaskList {
        let taskList = TaskList(name: name)
        CoreDataStack.shared.saveToPersistentStore()

        return taskList
    }
    
    @discardableResult func createTask(with name: String, notes: String?, priority: TaskPriority, in taskList: TaskList) -> Task {
        
        let task = Task(name: name, notes: notes, priority: priority, in: taskList, context: CoreDataStack.shared.mainContext)
        
        CoreDataStack.shared.saveToPersistentStore()
        
        return task
    }
    
    func updateTask(task: Task, with name: String, notes: String?, priority: TaskPriority) {
        
        task.name = name
        task.notes = notes
        task.priority = priority.rawValue
        
        CoreDataStack.shared.saveToPersistentStore()
    }
    
    func delete(task: Task) {
        
        CoreDataStack.shared.mainContext.delete(task)
        CoreDataStack.shared.saveToPersistentStore()
    }
}
