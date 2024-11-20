//
//  ProfileView.swift
//  RadioApp
//
//  Created by teamdoc on 20/11/2024.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    
    @State private var user: User? = DataManager.instance.user
    
    var body: some View {
        if let user = user {
            VStack(alignment: .center, spacing: 20) {
                TextField("Prénom", text: Binding(
                    get: { user.firstname ?? "" }, // Fournir une valeur par défaut si `firstname` est `nil`
                    set: { user.firstname = $0 }  // Mettre à jour la valeur
                ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 20)
                
                TextField("Nom", text: Binding(
                    get: { user.lastname ?? "" },
                    set: { user.lastname = $0 }
                ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 20)
                
                TextField("Email", text: Binding(
                    get: { user.email ?? "" },
                    set: { user.email = $0 }
                ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 20)
            }
        } else {
            Text("Aucun utilisateur trouvé")
                .foregroundColor(.red)
        }
    }

}


#Preview {
    ProfileView()
}
