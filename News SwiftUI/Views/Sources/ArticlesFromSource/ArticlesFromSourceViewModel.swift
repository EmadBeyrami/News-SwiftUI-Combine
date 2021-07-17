//
//  ArticlesFromSourceViewModel.swift
//  News SwiftUI
//
//  Created by Emad Bayramy on 7/17/21.
//

import SwiftUI
import Combine

final class ArticlesFromSourceViewModel: ObservableObject {
    private let apiProvider = APIProvider<ArticleEndpoint>()
    
    private var bag = Set<AnyCancellable>()
    
    @Published private(set) var articles: Articles = []
    
    func getArticles(from source: String) {
        apiProvider.getData(from: .getArticlesFromSource(source))
            .decode(type: ArticlesResponse.self, decoder: Container.jsonDecoder)
            .map { $0.articles }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.articles, on: self)
            .store(in: &bag)
    }
}
