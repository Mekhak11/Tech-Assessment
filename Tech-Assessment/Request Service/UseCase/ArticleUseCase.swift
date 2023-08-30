//
//  ArticleUseCase.swift
//  Tech-Assessment
//
//  Created by MEKHAK GHAPANTSYAN on 29.08.23.
//

import Foundation

class ArticlesUseCase {
    let articleRepository: ArticlesRepository
    
    init(articleRepository: ArticlesRepository) {
        self.articleRepository = articleRepository
    }
}

