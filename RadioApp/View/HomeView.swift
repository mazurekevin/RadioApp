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

    var body: some View {
        
        VStack {
            HeaderView(title: "Accueil").padding(.bottom, 10)
            //Spacer()
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
                        RadioItemView(radio: $radioStations[index])
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
        }
        Spacer()
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
        }) { error in
            print("Erreur lors de la récupération des données : \(error.localizedDescription)")
        }
    }
}

struct RadioItemView: View {
    @Binding var radio: RadioStation

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: radio.icon)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 125, height: 125)
                        .cornerRadius(8)
                } else if phase.error != nil {
                    Color.gray
                        .frame(width: 125, height: 125)
                        .cornerRadius(8)
                } else {
                    ProgressView()
                        .frame(width: 125, height: 125)
                }
            }
            Text(radio.name)
                .font(.caption)
                .padding(.top, 5)
        }
        .padding()
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
    }
}



#Preview {
    HomeView()
}
