//
//  RadioAppApp.swift
//  RadioApp
//
//  Created by teamdoc on 22/08/2024.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth
import CoreData

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        signInAnonymously()
        
        return true
    }
    
    func signInAnonymously() {
        Auth.auth().signInAnonymously { authResult, error in
            if let error = error {
                print("Erreur lors de l'authentification anonyme : \(error.localizedDescription)")
            } else {
                print("Authentification anonyme réussie, UID : \(authResult?.user.uid ?? "")")
            }
        }
    }
}

@main
struct RadioAppApp: App {
    
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    //let persistenceController = PersistenceController.shared

        
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                //.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
