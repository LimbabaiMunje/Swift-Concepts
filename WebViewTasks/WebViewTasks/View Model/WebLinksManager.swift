//
//  WebLinksManager.swift
//  WebViewTasks
//
//  Created by Mac on 14/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
struct WebLinkManager {
    static var sharedInstance = WebLinkManager()
    var webLinks = [WebLinksModel(website: "https://www.google.co.in", webImage: "google.png"), WebLinksModel(website: "https://www.facebook.com", webImage: "facebook.png"), WebLinksModel(website: "https://www.youtube.com", webImage: "Youtube.png"), WebLinksModel(website: "https://www.raywenderlich.com", webImage: "Raywenderlich.png"), WebLinksModel(website: "https://www.appcoda.com", webImage: "appcoda.png"), WebLinksModel(website: "https://www.esakal.com", webImage: "Sakal.png"), WebLinksModel(website: "https://www.cricbuzz.com", webImage: "cricbuzz.png"), WebLinksModel(website: "https://developer.apple.com", webImage: "Apple.png")]
}
