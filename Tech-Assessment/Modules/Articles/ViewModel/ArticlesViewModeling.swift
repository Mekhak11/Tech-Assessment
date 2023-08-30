//
//  ArticlesViewModeling.swift
//  Tech-Assessment
//
//  Created by MEKHAK GHAPANTSYAN on 30.08.23.
//

import Foundation

protocol ArticlesViewModeling: ObservableObject {
    var articles: ArticleListModel { get set }
    
    func getArticles()
}
