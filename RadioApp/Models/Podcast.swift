//
//  Podcast.swift
//  RadioApp
//
//  Created by teamdoc on 05/09/2024.
//

import Foundation
import SwiftyJSON

struct Podcast: Identifiable {
    var id: String
    var title: String
    var explicit: Bool
    var contentType: String
    var dead: Int
    var episodeCount: Int
    var description: String
    var lastGoodHttpStatusTime: Int
    var imageUrlHash: Int
    var link: String
    var generator: String
    var author: String
    var artwork: String
    var lastHttpStatus: Int
    var medium: String
    var inPollingQueue: Int
    var newestItemPubdate: Int
    var podcastGuid: String
    var itunesId: Int
    var originalUrl: String
    var lastCrawlTime: Int
    var crawlErrors: Int
    var categories: [String: String]
    var image: String
    var type: Int
    var ownerName: String
    var priority: Int
    var lastParseTime: Int
    var language: String
    var locked: Int
    var url: String
    var parseErrors: Int
    var lastUpdateTime: Int

    init(json: JSON) {
        id = json["id"].stringValue
        title = json["title"].stringValue
        explicit = json["explicit"].boolValue
        contentType = json["contentType"].stringValue
        dead = json["dead"].intValue
        episodeCount = json["episodeCount"].intValue
        description = json["description"].stringValue
        lastGoodHttpStatusTime = json["lastGoodHttpStatusTime"].intValue
        imageUrlHash = json["imageUrlHash"].intValue
        link = json["link"].stringValue
        generator = json["generator"].stringValue
        author = json["author"].stringValue
        artwork = json["artwork"].stringValue
        lastHttpStatus = json["lastHttpStatus"].intValue
        medium = json["medium"].stringValue
        inPollingQueue = json["inPollingQueue"].intValue
        newestItemPubdate = json["newestItemPubdate"].intValue
        podcastGuid = json["podcastGuid"].stringValue
        itunesId = json["itunesId"].intValue
        originalUrl = json["originalUrl"].stringValue
        lastCrawlTime = json["lastCrawlTime"].intValue
        crawlErrors = json["crawlErrors"].intValue
        categories = json["categories"].dictionaryValue.mapValues { $0.stringValue }
        image = json["image"].stringValue
        type = json["type"].intValue
        ownerName = json["ownerName"].stringValue
        priority = json["priority"].intValue
        lastParseTime = json["lastParseTime"].intValue
        language = json["language"].stringValue
        locked = json["locked"].intValue
        url = json["url"].stringValue
        parseErrors = json["parseErrors"].intValue
        lastUpdateTime = json["lastUpdateTime"].intValue
    }
}
