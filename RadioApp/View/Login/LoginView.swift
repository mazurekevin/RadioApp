//
//  LoginView.swift
//  RadioApp
//
//  Created by teamdoc on 15/11/2024.
//

import Foundation
import SwiftUI


struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var navigateToHome: Bool = false
    
    private func login(){
        let repository = UserRepository()
        repository.getUserByEmail(email: email) { user in
            if let user = user {
                print("Utilisateur trouvé : \(user.firstname ?? "") \(user.lastname ?? "")")
                if user.password == password{
                    DataManager.instance.user = user
                    navigateToHome = true
                }else{
                    print("pas le bon password")
                }
            } else {
                print("Aucun utilisateur trouvé avec cet email.")
            }
        }

    }

    
    var body: some View {
        
        NavigationStack(root: {
            VStack {
                // Titre avec un Spacer pour le placer à 100 points du haut de l'écran
                Spacer().frame(height: 100)
                
                Text("RadioApp")
                    .bold()
                    .font(.title)
                
                // Un Spacer pour pousser les text fields vers le centre de l'écran
                Spacer()
                
                VStack(spacing: 20) {
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 20)

                    SecureField("Mot de passe", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 20)
                }

                // Un Spacer pour séparer les text fields des boutons
                Spacer()
                
                VStack(spacing: 10) {
                    Button("Valider", action: {
                        login()
                    })
                    .padding()

                    NavigationLink(destination: CreateAccountView()) {
                        Text("Créer un compte")
                    }
                    .padding()
                }

                // Spacer final pour placer les boutons à 100 points du bas
                Spacer().frame(height: 100)
                NavigationLink(destination: NavBar(), isActive: $navigateToHome) {
                    EmptyView()
                }
            }
            .padding(.horizontal) // Espacement général sur les côtés
        })
        
        
    }


}

#Preview {
    LoginView()
}

