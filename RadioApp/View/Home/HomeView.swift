//
//  HomeView.swift
//  RadioApp
//
//  Created by teamdoc on 27/08/2024.
//


import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseDatabase
import SwiftyJSON

struct HomeView: View {
    @State private var radioStations: [RadioStation] = []
    @State private var podcastList: [Podcast] = []

    var body: some View {
        NavigationView{
            VStack {
                HeaderView(title: "Accueil").padding(.bottom, 10)
                HStack{
                    Text("Musique")
                        .bold()
                        .font(.title2)
                    Spacer()
                }
                .padding(.bottom,5)
                .padding(.horizontal,15)
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(radioStations.indices, id: \.self) { index in
                            NavigationLink(destination: RadioView(radio: radioStations[index])) {
                            RadioItemView(radio: $radioStations[index])
                            }
                        }
                    }
                }
                .frame(height: 200)
                .scrollIndicators(.hidden)
                HStack{
                    Text("Podcast")
                        .bold()
                        .font(.title2)
                    Spacer()
                }
                .padding(.bottom,5)
                .padding(.horizontal,15)
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(podcastList.indices, id: \.self) { index in
                            //NavigationLink(destination: RadioView(radio: radioStations[index])) {
                            PodcastItemView(podcast: $podcastList[index])
                            //}
                        }
                    }
                }
                .frame(height: 200)
                .scrollIndicators(.hidden)
                Spacer()
            }
            .padding(.horizontal)
            .onAppear {
                fetchData()
                //fetchDataTest()
            }
        }
    }

    func fetchData() {
        let ref = Database.database().reference()

        ref.child("prod/radio_items").observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value else {
                print("Aucune donnée trouvée à cet emplacement ou le format des données est incorrect.")
                return
            }

            let jsonData = JSON(value)
            let radioArray = jsonData.arrayValue
            self.radioStations = radioArray.map { RadioStation(json: $0) }
            //dump(self.radioStations.first)
        }) { error in
            print("Erreur lors de la récupération des données : \(error.localizedDescription)")
        }
        
        ref.child("prod/podcast_items").observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value else {
                print("Aucune donnée trouvée à cet emplacement ou le format des données est incorrect.")
                return
            }

            let jsonData = JSON(value)
            let podcastArray = jsonData.arrayValue
            self.podcastList = podcastArray.map { Podcast(json: $0) }
        }) { error in
            print("Erreur lors de la récupération des données : \(error.localizedDescription)")
        }
    }
    
    /*func fetchDataTest() {
        let ref = Database.database().reference()

        ref.child("prod/radio_main_music_items").observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value else {
                print("Aucune donnée trouvée à cet emplacement ou le format des données est incorrect.")
                return
            }

            let jsonData = JSON(value)
            let radioArray = jsonData.arrayValue
            dump(jsonData)
        }) { error in
            print("Erreur lors de la récupération des données : \(error.localizedDescription)")
        }
    }*/
}

#Preview {
    HomeView()
}
