//
//  SearchForArticlesView.swift
//  News SwiftUI
//
//  Created by Emad Bayramy on 7/17/21.
//


import SwiftUI

struct SearchForArticlesView : View {
    @ObservedObject var viewModel = SearchForArticlesViewModel()
    
    var body: some View {
        NavigationView(content: {
            VStack {
                SearchBarView(text: $viewModel.searchText)
                    .padding([.leading, .trailing], 8)
                
                ArticlesList(articles: viewModel.articles)
            }
            .navigationBarTitle(Text(Constants.title), displayMode: .large)
        })
    }
}

private extension SearchForArticlesView {
    
    struct Constants {
        static let title = "Search".localized
    }
}

