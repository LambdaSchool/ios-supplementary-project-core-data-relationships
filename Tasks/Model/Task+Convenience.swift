//
//  Task+Convenience.swift
//  Tasks
//
//  Created by Spencer Curtis on 9/16/19.
//  Copyright © 2019 Andrew R Madsen. All rights reserved.
//

import Foundation
import CoreData

enum TaskPriority: String, CaseIterable {
    case low
    case normal
    case high
    case critical
}

// Core Data already created the Task class, so we just want to add some extra functionality onto it.
extension Task {
    
    convenience init(name: String, notes: String?, priority: TaskPriority, in taskList: TaskList, context: NSManagedObjectContext) {
        
        // Setting up the generic NSManagedObject functionality of the model object
        // The generic chunk of clay
        self.init(context: context)
        
        // Once we have the clay, we can begin sculpting it into our unique model object
        self.name = name
        self.notes = notes
        self.priority = priority.rawValue
        
        // Because the relationship is inverse, this will also attach the task to the taskList.
        self.taskList = taskList
    }
}
