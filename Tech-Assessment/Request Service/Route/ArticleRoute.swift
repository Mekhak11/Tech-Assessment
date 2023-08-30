//
//  ArticleRoute.swift
//  Tech-Assessment
//
//  Created by MEKHAK GHAPANTSYAN on 29.08.23.
//

import Foundation

enum ArticleRute: Requestable {
    case getArticles(period: Int)
    
    var baseURL: URL {
        return URL(string: "https://api.nytimes.com/")!
    }
    
    var path: String {
        switch self {
        case .getArticles(let period):
            return "svc/mostpopular/v2/viewed/\(period).json"
        }
    }
    
    var parametrs: [String : Any]? {
        switch self {
        case .getArticles:
            let params: [String: Any] = [
                "api-key" : "8K0VRKiA5dYujDkPGFbbf36LRThkKNiF"
            ]
            return params
        }
    }
    
    var httpMethod: String {
        switch self {
        case .getArticles:
            return "GET"
        }
    }
}
