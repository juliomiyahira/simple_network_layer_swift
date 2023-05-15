//
//  Router.swift
//  
//
//  Created by julio cezar kenji Miyahira on 15/05/23.
//

import Foundation

protocol Router {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var parameters: [URLQueryItem]? { get }
    var methods: String { get }
}
