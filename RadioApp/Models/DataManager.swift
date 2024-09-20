//
//  DataManager.swift
//  RadioApp
//
//  Created by teamdoc on 13/09/2024.
//



import Foundation

class DataManager: NSObject {

    static var instance = DataManager()

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
        super.init()
    }

    func reset() {
        DataManager.instance = DataManager()
    }
    
}
