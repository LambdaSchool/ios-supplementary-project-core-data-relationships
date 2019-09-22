//
//  TaskList+Convenience.swift
//  Tasks
//
//  Created by Spencer Curtis on 9/21/19.
//  Copyright © 2019 Andrew R Madsen. All rights reserved.
//

import Foundation
import CoreData

extension TaskList {
    
    @discardableResult convenience init(name: String, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        
        self.name = name
    }
}
