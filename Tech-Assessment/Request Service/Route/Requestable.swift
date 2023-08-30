//
//  Requestable.swift
//  Tech-Assessment
//
//  Created by MEKHAK GHAPANTSYAN on 29.08.23.
//

import Foundation

protocol Requestable {
    var baseURL: URL { get }
    var path: String { get }
    var parametrs: [String: Any]? { get }
    var httpMethod: String { get }
}
