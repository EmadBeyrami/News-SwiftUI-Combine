//
//  SourcesListViewModel.swift
//  News SwiftUI
//
//  Created by Emad Bayramy on 7/17/21.
//

import SwiftUI
import Combine

final class SourcesListViewModel: ObservableObject {
    private let apiProvider = APIProvider<ArticleEndpoint>()
    
    private var bag = Set<AnyCancellable>()
    
    @Published private(set) var sources: Sources = []
    
    func getSources() {
        apiProvider.getData(from: .getSources)
            .decode(type: SourcesResponse.self, decoder: Container.jsonDecoder)
            .map { $0.sources }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.sources, on: self)
            .store(in: &bag)
    }
}
