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
    
    private func login(){
        
    }

    private func createAccountView(){
        
    }
    
    /*var body: some View {
        VStack(alignment: .center, spacing: 20) { // Utiliser `spacing` pour un espacement uniforme
            Text("RadioApp")
                .bold()
                .font(.title)
                .padding([.top, .leading, .trailing], 100) // Ajouter un espace au-dessus du titre
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading, .trailing], 20) // Espacement horizontal
                .padding(.top, 150)

            SecureField("Mot de passe", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.leading, .trailing], 20) // Espacement horizontal

            Spacer()
            Button("Valider", action: {
                login()
            })
            
    

            Button("Créer un compte", action: {
                createAccountView()
            })

            Spacer() // Espacer le bas de l'écran
        }
        .padding()
         // Espacement général autour du VStack
    }*/
    var body: some View {
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

                Button("Créer un compte", action: {
                    createAccountView()
                })
            }

            // Spacer final pour placer les boutons à 100 points du bas
            Spacer().frame(height: 100)
        }
        .padding(.horizontal) // Espacement général sur les côtés
    }


}

#Preview {
    LoginView()
}

