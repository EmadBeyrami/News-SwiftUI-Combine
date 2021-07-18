//
//  SearchForArticlesViewModel.swift
//  News SwiftUI
//
//  Created by Emad Bayramy on 7/17/21.
//


import SwiftUI
import Combine

final class SearchForArticlesViewModel: ObservableObject {
    private let apiProvider = APIProvider<ArticleEndpoint>()
    
    private var bag = Set<AnyCancellable>()
    
    @Published var searchText: String = "" {
        didSet {
            searchForArticles(searchFilter: searchText)
        }
    }
    @Published private (set) var articles: Articles = []
    
    func searchForArticles(searchFilter: String) {
        apiProvider.getData(from: .searchForArticles(searchFilter: searchFilter))
            .decode(type: ArticlesResponse.self, decoder: Container.jsonDecoder)
            .map { $0.articles }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] articles in
                self?.articles = articles
            })
            .store(in: &bag)
    }
}
