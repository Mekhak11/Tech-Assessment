//
//  ArticlesListView.swift
//  Tech-Assessment
//
//  Created by MEKHAK GHAPANTSYAN on 29.08.23.
//

import SwiftUI

struct ArticlesListView<M: ArticlesViewModeling>: View {
    @ObservedObject var viewModel: M
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach($viewModel.articles.results, id: \.id) { $article in
                    NavigationLink(destination: ArticleDetailsView(article: $article)) {
                        ArticleCell(article: $article)
                    }
                    
                }
            }
        }
            .onAppear {
                viewModel.getArticles()
            }
    }
}

struct ArticlesListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesListView<ArticlesViewModel>(viewModel: ArticlesViewModel(getArticlesUseCase: GetArticlesUseCase(articleRepository: DefaultArticleRepository(handler: RequestHandler()))))
    }
}
