//
//  Model.swift
//  
//
//  Created by julio cezar kenji Miyahira on 15/05/23.
//

import Foundation

internal struct Model: Codable {

    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }

}
