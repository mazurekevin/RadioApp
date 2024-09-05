//
//  NavBar.swift
//  RadioApp
//
//  Created by teamdoc on 27/08/2024.
//

import Foundation
import SwiftUI
struct NavBar: View{
    var body: some View{
        NavigationView{
            TabView{
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Accueil")
                    }
                RadioListView()
                    .tabItem {
                        Image(systemName: "radio")
                        Text("Radios")
                    }
                PodcastListView()
                    .tabItem {
                        Image(systemName: "waveform.circle.fill")
                        Text("Podcasts")
                    }
                LibraryView()
                    .tabItem {
                        Image(systemName: "books.vertical.fill")
                        Text("Bibliothèque")
                    }
                
            }
        }
        
    }
}


struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}

/*struct NavBar: View {
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
            }
            .tabItem {
                Image(systemName: "house")
                Text("Accueil")
            }

            NavigationView {
                RadioListView()
            }
            .tabItem {
                Image(systemName: "radio")
                Text("Radios")
            }

            NavigationView {
                PodcastListView()
            }
            .tabItem {
                Image(systemName: "waveform.circle.fill")
                Text("Podcasts")
            }

            NavigationView {
                LibraryView()
            }
            .tabItem {
                Image(systemName: "books.vertical.fill")
                Text("Bibliothèque")
            }
        }
    }
}*/

