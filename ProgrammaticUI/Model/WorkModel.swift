//
//  WorkModel.swift
//  ProgrammaticUI
//
//  Created by İlker Kaya on 13.02.2023.
//

import Foundation

struct WorkVideo{
    let title: String
    let duration: String
    let bg_image: String
    let profile_image: String
    let subtitle: String
    
    static let data:[WorkVideo] = [
        WorkVideo(title: "Daily move", duration: "6 min", bg_image: "yoga1", profile_image: "profile1", subtitle: "A daily stretching practice for everyone"),
        WorkVideo(title: "Daily Calm", duration: "10 min", bg_image: "yoga2", profile_image: "profile2", subtitle: "A daily stretching practice for everyone"),
        WorkVideo(title: "Daily move", duration: "5 min", bg_image: "yoga3", profile_image: "profile3", subtitle: "A daily stretching practice for everyone"),
        WorkVideo(title: "Daily move", duration: "15 min", bg_image: "yoga4", profile_image: "profile1", subtitle: "A daily stretching practice for everyone"),
    ]
}
