//
//  UserRepository.swift
//  RadioApp
//
//  Created by teamdoc on 18/11/2024.
//

import Foundation
import CoreData

final class UserRepository {


  private let coreDataStack: CoreDataStack


  init(coreDataStack: CoreDataStack = CoreDataStack.sharedInstance) {
    self.coreDataStack = coreDataStack
  }


    func getUsers(completion: ([User]) -> Void) {
       let request: NSFetchRequest<User> = User.fetchRequest()
       do {
         let users = try coreDataStack.viewContext.fetch(request)
         completion(users)
       } catch {
         completion([])
       }
    }

    func saveUser(named firstname: String, lastname: String, email: String, password: String, completion: () -> Void) {
       let user = User(context: coreDataStack.viewContext)
        user.firstname = firstname
        user.lastname = lastname
        user.email = email
        user.password = password
       do {
         try coreDataStack.viewContext.save()
           DataManager.instance.user = user
         completion()
       } catch {
         print("We were unable to save \(firstname)")
       }
    }
    
    func getUserByEmail(email: String, completion: (User?) -> Void) {
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate(format: "email == %@", email) 
        
        do {
            let users = try coreDataStack.viewContext.fetch(request)
            completion(users.first)
        } catch {
            print("Erreur lors de la récupération de l'utilisateur par email : \(error.localizedDescription)")
            completion(nil)
        }
    }

    
    func clearAllData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "User")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try CoreDataStack.sharedInstance.viewContext.execute(deleteRequest)
            try CoreDataStack.sharedInstance.viewContext.save()
            
        } catch let error as NSError {
            print("Erreur lors de la suppression des données: \(error), \(error.userInfo)")
        }
    }
}
