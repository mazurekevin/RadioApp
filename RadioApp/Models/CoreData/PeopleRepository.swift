//
//  PeopleRepository.swift
//  RadioApp
//
//  Created by teamdoc on 13/11/2024.
//

import Foundation
import CoreData

final class PeopleRepository {


  private let coreDataStack: CoreDataStack


  init(coreDataStack: CoreDataStack = CoreDataStack.sharedInstance) {
    self.coreDataStack = coreDataStack
  }


    func getPersons(completion: ([Person]) -> Void) {
       let request: NSFetchRequest<Person> = Person.fetchRequest()
       do {
         let persons = try coreDataStack.viewContext.fetch(request)
         completion(persons)
       } catch {
         completion([])
       }
    }

    func savePerson(named name: String, lastname: String, age: Int, completion: () -> Void) {
       let person = Person(context: coreDataStack.viewContext)
       person.name = name
        person.age = Int32(age)
        person.lastName = lastname
       do {
         try coreDataStack.viewContext.save()
         completion()
       } catch {
         print("We were unable to save \(name)")
       }
    }
    
    func clearAllData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Person")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try CoreDataStack.sharedInstance.viewContext.execute(deleteRequest)
            try CoreDataStack.sharedInstance.viewContext.save()
            
        } catch let error as NSError {
            print("Erreur lors de la suppression des données: \(error), \(error.userInfo)")
        }
    }
}
