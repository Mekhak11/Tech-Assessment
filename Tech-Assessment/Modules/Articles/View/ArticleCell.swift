//
//  ArticleCell.swift
//  Tech-Assessment
//
//  Created by MEKHAK GHAPANTSYAN on 28.08.23.
//

import SwiftUI

struct ArticleCell: View {
    @Binding var article: ArticleModel
    var body: some View {
        content
    }
}

extension ArticleCell {
    private var content: some View {
        HStack {
            image
            Spacer()
            articleInfo
            Spacer()
        }.padding(8)
    }
    
    private var image: some View {
        AsyncImage(url: URL(string: article.media.first?.mediaMetadata.first?.url ?? ""))
            .frame(width: 70, height: 70)
            
    }
    
    private var articleInfo: some View {
        HStack {
            VStack(alignment: .leading) {
                tite
                author
                date
            }
            Spacer()
        }
    }
    
    private var tite: some View {
        Text(article.title)
            .lineLimit(2)
            .foregroundColor(.black)
            .font(.title)
            .multilineTextAlignment(.leading)
    }
    
    private var author: some View {
        Text(article.byline)
            .lineLimit(2)
            .foregroundColor(.gray)
            .font(.subheadline)
            .multilineTextAlignment(.leading)
    }
    
    private var date: some View {
        Text(article.publishedDate)
            .foregroundColor(.gray)
            .font(.subheadline)
            .multilineTextAlignment(.leading)
    }
}

//struct ArticleCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticleCell()
//    }
//}
