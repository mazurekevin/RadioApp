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




struct RadioStation: Identifiable {
    var id: Int
    var countryCode: String
    var description: String
    var group: Int
    var groupName: String
    var groupParent: Int
    var hideToAll: Bool
    var hls: Bool
    var icon: String
    var image: String
    var metadata: String
    var name: String
    var parentIcon: String
    var sLatitude: String
    var sLongitude: String
    var stationUuid: String
    var streamUrls: [String: String]
    var subTitle: String
    var title: String
    var website: String

    static func fromDictionary(_ dict: [String: Any]) -> RadioStation? {
        guard
            let id = dict["id"] as? Int,
            let countryCode = dict["countryCode"] as? String,
            let description = dict["description"] as? String,
            let group = dict["group"] as? Int,
            let groupName = dict["groupName"] as? String,
            let groupParent = dict["groupParent"] as? Int,
            let hideToAll = dict["hideToAll"] as? Int,
            let hls = dict["hls"] as? Int,
            let icon = dict["icon"] as? String,
            let image = dict["image"] as? String,
            let metadata = dict["metadata"] as? String,
            let name = dict["name"] as? String,
            let parentIcon = dict["parentIcon"] as? String,
            let sLatitude = dict["sLatitude"] as? String,
            let sLongitude = dict["sLongitude"] as? String,
            let stationUuid = dict["stationUuid"] as? String,
            let streamUrls = dict["streamUrls"] as? [String: String],
            let subTitle = dict["subTitle"] as? String,
            let title = dict["title"] as? String,
            let website = dict["website"] as? String
        else {
            return nil
        }

        return RadioStation(
            id: id,
            countryCode: countryCode,
            description: description,
            group: group,
            groupName: groupName,
            groupParent: groupParent,
            hideToAll: hideToAll == 1,
            hls: hls == 1,
            icon: icon,
            image: image,
            metadata: metadata,
            name: name,
            parentIcon: parentIcon,
            sLatitude: sLatitude,
            sLongitude: sLongitude,
            stationUuid: stationUuid,
            streamUrls: streamUrls,
            subTitle: subTitle,
            title: title,
            website: website
        )
    }
}



struct HomeView: View {
    @State private var datas: [[String:Any]] = [[:]]

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
                guard let value = snapshot.value as? [[String:Any]] else {
                    print("Aucune donnée trouvée à cet emplacement ou le format des données est incorrect.")
                    return
                }
                self.datas = value
                /*self.datas = value.compactMap { itemDict in
                    return RadioStation.fromDictionary(itemDict)
                }*/

                print("Données récupérées : \(self.datas)")
            }) { error in
                print("Erreur lors de la récupération des données : \(error.localizedDescription)")
            }
        }
}



