//
//  CreateAccount.swift
//  RadioApp
//
//  Created by teamdoc on 17/11/2024.
//

import Foundation
import SwiftUI

struct CreateAccountView: View {
    
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var CheckPassword: String = ""
    
    private func createAccount(){
        
    }
    
    var body: some View {
        NavigationView(content: {
            VStack(alignment: .center, spacing: 20, content: {
                Spacer().frame(height: 100)
                Text("Créer un compte")
                    .bold()
                    .font(.title)
                Spacer()
                VStack(spacing: 20, content: {
                    TextField("Prénom", text: $firstname)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 20)
                    TextField("Nom", text: $lastname)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 20)
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 20)
                    SecureField("Mot de passe", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 20)
                    SecureField("Vérification du mot de passe", text: $CheckPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 20)
                })
                Spacer()
                Button("Valider", action: {
                    createAccount()
                })
                Spacer().frame(height: 100)
            })
            .padding()
        })
        
    }
}


#Preview {
    CreateAccountView()
}
