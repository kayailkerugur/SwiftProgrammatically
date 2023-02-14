//
//  PhotoModel.swift
//  ProgrammaticUI
//
//  Created by İlker Kaya on 8.02.2023.
//

import Foundation

struct Photo: Codable {
    let albumID: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailURL: String
    
    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id = "id"
        case title = "title"
        case url = "url"
        case thumbnailURL = "thumbnailUrl"
    }
}
