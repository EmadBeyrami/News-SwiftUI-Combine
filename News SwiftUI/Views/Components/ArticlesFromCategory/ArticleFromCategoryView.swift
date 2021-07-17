//
//  ArticleFromCategoryView.swift
//  News
//
//  Created by Emad Bayramy on 7/16/21.
//

import SwiftUI

struct ArticlesFromCategoryView : View {
    @ObservedObject var viewModel = ArticlesFromCategoryViewModel()
    
    let category: String
    
    var body: some View {
        VStack {
            if viewModel.articles.isEmpty {
                ActivityIndicator()
                    .frame(width: UIScreen.main.bounds.width,
                           height: 50,
                           alignment: .center)
            } else {
                ArticlesList(articles: viewModel.articles)
            }
        }
        .onAppear {
            self.viewModel.getArticles(from: self.category)
        }
    }
}
