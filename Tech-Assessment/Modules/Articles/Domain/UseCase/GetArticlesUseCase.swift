//
//  GetArticlesUseCase.swift
//  Tech-Assessment
//
//  Created by MEKHAK GHAPANTSYAN on 29.08.23.
//

import Foundation
import Combine

final class GetArticlesUseCase: ArticlesUseCase {
    func execute(period: Int) -> AnyPublisher<ArticleListModel, Error>{
        articleRepository.getArticles(period: period)
            .map { result in
                ArticleListModel(dto: result)
            }.eraseToAnyPublisher()
    }
}
