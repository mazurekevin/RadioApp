//
//  PodcastView.swift
//  RadioApp
//
//  Created by teamdoc on 01/10/2024.
//

import SwiftUI
import CoreData


struct PodcastView: View {
    
    var podcast: Podcast
    
    @State private var name: String = ""
    @State private var people: [String] = [] // Stocker les noms
    private let repository = PeopleRepository()
    
    // Fonction pour charger les personnes depuis Core Data
    private func getPeople() {
        repository.getPersons { persons in
            // Mise à jour de la liste des personnes dans l'état SwiftUI
            DispatchQueue.main.async {
                self.people = persons.compactMap { $0.name }
            }
        }
    }

    private func addPerson() {
        if !name.isEmpty {
            repository.savePerson(named: name) {
                // Ajouter la personne localement à la liste
                DispatchQueue.main.async {
                    self.people.append(name)
                    self.name = "" // Réinitialiser le champ de texte
                }
            }
        }
    }

    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            TextField("Enter your name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                addPerson()
            }) {
                Text("Add Name")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            Text("People List:")
                .font(.headline)
            
            ForEach(people, id: \.self) { person in
                Text(person)
            }
        }
        .padding()
        .onAppear {
            getPeople() // Charger les personnes au démarrage de la vue
        }
    }
}
