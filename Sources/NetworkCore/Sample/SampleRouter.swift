//
//  SampleRouter.swift
//  
//
//  Created by julio cezar kenji Miyahira on 15/05/23.
//

import Foundation

internal enum SampleRouter: Router {

    case allPhotos
    case allPhotosTwo

    internal var path: String {
        switch self {
        case .allPhotos:
            return "/photos"
        case .allPhotosTwo:
            return "/photos2"
        }
    }

    internal var parameters: [URLQueryItem]? {
        return nil
    }

    internal var methods: String {
        return "GET"
    }

    internal var scheme: String {
        return "https"
    }

    internal var host: String {
        return "jsonplaceholder.typicode.com"
    }

}
