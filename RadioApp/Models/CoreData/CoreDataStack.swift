//
//  CoreDataStack.swift
//  RadioApp
//
//  Created by teamdoc on 12/11/2024.
//

import Foundation
import CoreData
final class CoreDataStack {

    // MARK: - Singleton

   static let sharedInstance = CoreDataStack()

   // MARK: - Public

   var myProperty: AnyObject? // <--- Propriété exemple

    // MARK: - Private

    private lazy var persistentContainer: NSPersistentContainer = {
      let container = NSPersistentContainer(name: "RadioApp")
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError? {
          fatalError("Unresolved error \(error), \(error.userInfo)")
        }
      })
      return container
    }()
    
    var viewContext: NSManagedObjectContext {
        return CoreDataStack.sharedInstance.persistentContainer.viewContext
    }
}
