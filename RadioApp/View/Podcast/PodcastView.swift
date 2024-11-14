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
    @State private var lastname: String = ""
    @State private var age: Int = 0
    @State private var people: [Person] = [] // Stocker les noms
    private let repository = PeopleRepository()
    
    // Fonction pour charger les personnes depuis Core Data
    private func getPeople() {
        
        repository.getPersons { persons in
            // Mise à jour de la liste des personnes dans l'état SwiftUI
            DispatchQueue.main.async {
                self.people.removeAll()
                self.people = persons
            }
        }
    }

    private func addPerson() {
        if !name.isEmpty && !age.words.isEmpty && !lastname.isEmpty{
            repository.savePerson(named: name, lastname: lastname, age: age) {
                // Ajouter la personne localement à la liste
                DispatchQueue.main.async {
                    //self.people.append(name)
                    self.name = "" // Réinitialiser le champ de texte
                    self.lastname = ""
                    self.age = 0
                    getPeople()
                }
            }
        }
    }

    private func clearAllData() {
        repository.clearAllData()
        DispatchQueue.main.async {
            self.people.removeAll() // Met à jour la vue pour refléter la suppression
        }
        
    }

    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 10) {
            TextField("Enter your name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Enter your lastname", text: $lastname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Enter your age", value: $age, format: .number)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button(action: {
                addPerson()
            }) {
                Text("Add Person")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            Button(action: {
                clearAllData()
            }) {
                Text("Clear All Data")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            
            Text("People List:")
                .font(.headline)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    ForEach(people, id: \.objectID) { person in
                        VStack(alignment: .leading) {
                            Text(person.name ?? "")
                            Text(person.lastName ?? "")
                            Text("\(person.age)")
                        }
                        .padding(.vertical, 5)
                    }
                }
            }
            .frame(maxHeight: 300)
        }
        .padding()
        .onAppear {
            getPeople() // Charger les personnes au démarrage de la vue
        }
    }
}
