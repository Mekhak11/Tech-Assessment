//
//  ArticleDetailsView.swift
//  Tech-Assessment
//
//  Created by MEKHAK GHAPANTSYAN on 30.08.23.
//

import SwiftUI

struct ArticleDetailsView: View {
    @Binding var article: ArticleModel
    var body: some View {
        VStack (spacing: 16){
            image
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    title
                    HStack(alignment: .bottom){
                        author
                        Spacer()
                        date
                    }
                    description
                }
            }
            Spacer()
        }.padding()
    }
}


extension ArticleDetailsView {
    private var image: some View {
        AsyncImage(url: URL(string: article.media.first?.mediaMetadata.first?.url ?? ""))
            .frame(
                width:CGFloat(article.media.first?.mediaMetadata.first?.width ?? 70),
                height: CGFloat(article.media.first?.mediaMetadata.first?.height ?? 70))
    }
    
    private var title: some View {
        Text(article.title)
            .foregroundColor(.black)
            .font(.title)
            .multilineTextAlignment(.leading)
    }
    
    private var description: some View {
        Text(article.abstract)
            .foregroundColor(.gray)
            .font(.subheadline)
    }
    
    private var author: some View {
        Text(article.byline)
            .foregroundColor(.gray)
            .font(.subheadline)
    }
    
    private var date: some View {
        Text(article.publishedDate)
            .foregroundColor(.gray)
            .font(.subheadline)
    }
    
}

struct ArticleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailsView(article: .constant(ArticleModel(uri: "", url: "", id: 0, assetID: 0, source: "", publishedDate: "2023-11-11", updated: "", section: "", subsection: "", nytdsection: "", adxKeywords: "", byline: "By Author", type: "", title: "", abstract: "", desFacet: [], perFacet: [], geoFacet: [], media: [], etaID: 0)))
    }
}
