//
//  ArticlesViewModel.swift
//  Tech-Assessment
//
//  Created by MEKHAK GHAPANTSYAN on 29.08.23.
//

import Foundation
import Combine

final class ArticlesViewModel: ArticlesViewModeling {
    @Published var articles: ArticleListModel = ArticleListModel(status: "", copyright: "", numResults: 0, results: [])
    
    private var getArticlesUseCase: GetArticlesUseCase
    private var cancelables = Set<AnyCancellable>()
    
    init(getArticlesUseCase: GetArticlesUseCase) {
        self.getArticlesUseCase = getArticlesUseCase
    }
    
    func getArticles() {
        getArticlesUseCase.execute(period: 7)
            .sink {  result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: {[weak self] list in
                DispatchQueue.main.async {
                    self?.articles = list
                }
            }.store(in: &cancelables)

    }
}
