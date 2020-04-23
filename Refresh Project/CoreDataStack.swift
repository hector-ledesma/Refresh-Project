//
//  CoreDataStack.swift
//  Refresh Project
//
//  Created by Karen Rodriguez on 4/23/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    // Create private initializer
    private init() {}
    
    // Create the singleton instance of this stack.
    static let shared = CoreDataStack()
    
    // We're going to need a container.
    // The container sets up the model, context and store coordinator all at once.
    
    var container: NSPersistentContainer = {
        // I believe the name is for the container must match the name for the .xcdatamodeld file.
        let container = NSPersistentContainer(name: "Refresh")
        
        // When a computed property is called, it will .... well, compute.
        // First we want to load what we have.
        container.loadPersistentStores { (_, error) in
            // Unwrap the error, but don't nuke the app.
            if let error = error {
                NSLog("Couldn't load items from persistent store : \(error)")
            }
        }
        
        // This will automatically update things whenever we change CoreData.
        // Don't do it for an app that may contain a ton of entries.
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        return container
    }() // We'll be returning a customized instance. I believe the parentheses at the end actually initialize this instance.
    
}
