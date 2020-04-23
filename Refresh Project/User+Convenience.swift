//
//  User+Convenience.swift
//  Refresh Project
//
//  Created by Karen Rodriguez on 4/23/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import Foundation
import CoreData

// The extension has to match what the Entity was named.
// I had to restart this xcodeproject for it to find User. Something to keep in mind.
extension User {
    
    // MARK: - What is 'convenience' init
    // MARK: - Why do we use @discardableResult
    
    @discardableResult convenience init(username: String, password: String, email: String, id: UUID = UUID(), context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        // Don't think of this as some sort of class. We're literally just making it easier for us, but we're still using CoreData here. It needs to know what context it will be created in.
        self.init(context: context)
        
        self.username = username
        self.password = password
        self.email = email
    }
    
}
