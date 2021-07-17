//
//  ArticlesList.swift
//  News
//
//  Created by Emad Bayramy on 7/16/21.
//

import SwiftUI

struct ArticlesList : View {
    @State var shouldPresent: Bool = false
    @State var articleURL: URL?
    
    @State var articles: [Article]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                ForEach(articles, id: \.self) { article in
                    ArticleRow(article: article)
                        .animation(.spring())
                        .onTapGesture {
                            self.articleURL = article.url
                            self.shouldPresent = true
                        }
                }
            }
        }
        .sheet(isPresented: $shouldPresent) {
            SafariView(url: self.articleURL!)
        }
    }
}
