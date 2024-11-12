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
    
    // Méthode pour récupérer les personnes depuis Core Data
    private func loadPeople() {
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        
        guard let fetchedPeople = try? CoreDataStack.sharedInstance.viewContext.fetch(request) else {
            return
        }
        
        // Mettre à jour l'état avec les noms des personnes
        people = fetchedPeople.compactMap { $0.name }
    }
    
    private func addPerson() {
        if !name.isEmpty {
            people.append(name)
            savePerson(named: name)
            name = "" // Réinitialiser le champ de texte après ajout
        }
    }
    
    private func savePerson(named name: String) {
        let person = Person(context: CoreDataStack.sharedInstance.viewContext)
        person.name = name
        try? CoreDataStack.sharedInstance.viewContext.save()
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
            loadPeople() // Charger les personnes au démarrage de la vue
        }
    }
}
