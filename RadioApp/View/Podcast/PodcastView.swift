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
    
    // On suppose que le contexte de Core Data est disponible
    @Environment(\.managedObjectContext) private var viewContext
    
    // Utilisation de @FetchRequest pour récupérer les podcasts depuis Core Data
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Podcast2.title, ascending: true)],
        animation: .default)
    private var podcasts: FetchedResults<Podcast2>
    
    func addPodcast(title: String, description: String) {
            let newPodcast = Podcast2(context: viewContext)
            newPodcast.id = UUID()
            newPodcast.title = title
            newPodcast.description = description
            
            do {
                try viewContext.save()  // Sauvegarde des modifications
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    
    var body: some View {
        NavigationView {
            List(podcasts, id: \.id) { podcast in
                VStack(alignment: .leading) {
                    Text(podcast.title)
                        .font(.headline)
                    Text(podcast.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Podcasts")
        }
    }
}

