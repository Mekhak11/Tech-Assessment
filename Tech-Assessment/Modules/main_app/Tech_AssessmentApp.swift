//
//  Tech_AssessmentApp.swift
//  Tech-Assessment
//
//  Created by MEKHAK GHAPANTSYAN on 28.08.23.
//

import SwiftUI

@main
struct Tech_AssessmentApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ArticlesListView<ArticlesViewModel>(viewModel: ArticlesViewModel(getArticlesUseCase: GetArticlesUseCase(articleRepository: DefaultArticleRepository(handler: RequestHandler()))))
            }
        }
    }
}
