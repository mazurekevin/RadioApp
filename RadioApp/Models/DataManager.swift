//
//  DataManager.swift
//  RadioApp
//
//  Created by teamdoc on 13/09/2024.
//



import Foundation

class DataManager: NSObject {

    static var instance = DataManager()
    
    ///user
    var user: User?

    /// radio
    var radioList: [RadioStation]
    var favoriteRadioList: [RadioStation]
    
    /// podcast
    var podcastList: [Podcast]
    var favoritePodcastList: [Podcast]
    
    override init() {
        radioList = []
        favoriteRadioList = []
        podcastList = []
        favoritePodcastList = []
        user = nil
        super.init()
    }

    func reset() {
        DataManager.instance = DataManager()
    }
    
}
