//
//  APIProvider.swift
//  News
//
//  Created by Emad Bayramy on 7/16/21.
//

import Foundation
import Combine

// MARK: - Network Layer
class APIProvider<Endpoint: EndpointProtocol> {
    // MARK: check the URL and Data
    func getData(from endpoint: Endpoint) -> AnyPublisher<Data, Error> {
        guard let request = performRequest(for: endpoint) else {
            return Fail(error: APIProviderErrors.invalidURL)
                .eraseToAnyPublisher()
        }
        
        return loadData(with: request)
            .eraseToAnyPublisher()
    }
    
    // MARK: - Request building
    private func performRequest(for endpoint: Endpoint) -> URLRequest? {
        print("=========================== Start Request Log ==============================")
        defer {
            print("=========================== End Request Log ==============================")
        }
        print("URL:  ",endpoint.absoluteURL)
        guard var urlComponents = URLComponents(string: endpoint.absoluteURL) else {
            return nil
        }
        print("Components:  ", endpoint.params )
        urlComponents.queryItems = endpoint.params.compactMap({ param -> URLQueryItem in
            return URLQueryItem(name: param.key, value: param.value)
        })

        guard let url = urlComponents.url else {
            return nil
        }
        print("full URL:", url)
        var urlRequest = URLRequest(url: url,
                                    cachePolicy: .reloadRevalidatingCacheData,
                                    timeoutInterval: 30)
        
        endpoint.headers.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
        
        return urlRequest
    }
    
    // MARK: - Getting data
    private func loadData(with request: URLRequest) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: request)
            .mapError({ error -> Error in
                APIErrors(rawValue: error.code.rawValue) ?? APIProviderErrors.unknownError
            })
            .map { $0.data }
            .eraseToAnyPublisher()
    }
}
