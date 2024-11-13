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

    func savePerson(named name: String, completion: () -> Void) {
       let person = Person(context: coreDataStack.viewContext)
       person.name = name
       do {
         try coreDataStack.viewContext.save()
         completion()
       } catch {
         print("We were unable to save \(name)")
       }
    }
}
