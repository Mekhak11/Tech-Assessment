//
//  ArticlesRepository.swift
//  Tech-Assessment
//
//  Created by MEKHAK GHAPANTSYAN on 29.08.23.
//

import Foundation
import Combine

protocol ArticlesRepository {
    var handler: Handler { get set }
    
    func getArticles(period: Int) -> AnyPublisher<ArticleListDTO, Error>
}

final class DefaultArticleRepository:  ArticlesRepository {
    var handler: Handler
    
    init(handler: Handler) {
        self.handler = handler
    }
    
    func getArticles(period: Int) -> AnyPublisher<ArticleListDTO, Error> {
        handler.request(endpoint: ArticleRute.getArticles(period: period))
    }
}
