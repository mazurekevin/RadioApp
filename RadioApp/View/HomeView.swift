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
            HeaderView(title: "Accueil").padding(.bottom, 20)
            Spacer()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Home!")
            Spacer()
        }
        .padding()
        .onAppear {
            fetchData()
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
            dump(self.radioStations.first?.description)
        }) { error in
            print("Erreur lors de la récupération des données : \(error.localizedDescription)")
        }
    }
}

