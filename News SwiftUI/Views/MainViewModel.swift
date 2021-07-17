//
//  MainViewModel.swift
//  News
//
//  Created by Emad Bayramy on 7/16/21.
//

import SwiftUI
import Combine

final class MainViewModel: ObservableObject {
    private let apiProvider = APIProvider<ArticleEndpoint>()
    
    private var bag = Set<AnyCancellable>()
    
    @Published private(set) var topHeadlines: Articles = []
    
    func getTopHeadlines() {
        apiProvider.getData(from: .getTopHeadlines)
            .decode(type: ArticlesResponse.self, decoder: Container.jsonDecoder)
            .map { $0.articles }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.topHeadlines, on: self)
            .store(in: &bag)
    }
}
