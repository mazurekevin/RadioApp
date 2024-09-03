//
//  RadioStation.swift
//  RadioApp
//
//  Created by teamdoc on 03/09/2024.
//

import Foundation
import SwiftyJSON
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

    init(json: JSON) {
            id = json["id"].intValue
            countryCode = json["countryCode"].stringValue
            description = json["description"].stringValue
            group = json["group"].intValue
            groupName = json["groupName"].stringValue
            groupParent = json["groupParent"].intValue
            hideToAll = json["hideToAll"].boolValue
            hls = json["hls"].boolValue
            icon = json["icon"].stringValue
            image = json["image"].stringValue
            metadata = json["metadata"].stringValue
            name = json["name"].stringValue
            parentIcon = json["parentIcon"].stringValue
            sLatitude = json["sLatitude"].stringValue
            sLongitude = json["sLongitude"].stringValue
            stationUuid = json["stationUuid"].stringValue
            streamUrls = json["streamUrls"].dictionaryValue.mapValues { $0.stringValue }
            subTitle = json["subTitle"].stringValue
            title = json["title"].stringValue
            website = json["website"].stringValue
        }
}
