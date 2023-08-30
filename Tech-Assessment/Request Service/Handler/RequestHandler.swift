//
//  RequestHandler.swift
//  Tech-Assessment
//
//  Created by MEKHAK GHAPANTSYAN on 29.08.23.
//

import Foundation
import Combine

protocol Handler {
    func request<T: Decodable>(endpoint: Requestable) -> AnyPublisher<T, Error>
}

class RequestHandler: Handler {
    func request<T: Decodable>(endpoint: Requestable) -> AnyPublisher<T, Error> {
        var components = URLComponents(url: endpoint.baseURL.appendingPathComponent(endpoint.path), resolvingAgainstBaseURL: true)
        if let parameters = endpoint.parametrs {
            components?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: String(describing: $0.value)) }
        }
        
        guard let url = components?.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
