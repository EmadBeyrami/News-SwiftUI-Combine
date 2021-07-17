//
//  ArticleEndPoint.swift
//  News
//
//  Created by Emad Bayramy on 7/16/21.
//

import Foundation

enum ArticleEndpoint: EndpointProtocol {
    case getTopHeadlines
    case getArticlesFromCategory(_ category: String)
    case getSources
    case getArticlesFromSource(_ source: String)
    case searchForArticles(searchFilter: String)
    
    struct InfoPlistKey {
        static let baseAPIURL = "BaseAPIURL"
    }
    
    var baseURL: String {
        let baseApiPrefix = Bundle.main.info(for: InfoPlistKey.baseAPIURL)!
        let baseAPIVersion = "v2/"
        return baseApiPrefix + baseAPIVersion
    }
    
    var absoluteURL: String {
        switch self {
        case .getTopHeadlines, .getArticlesFromCategory:
            return baseURL + "top-headlines"
            
        case .getSources:
            return baseURL + "sources"
            
        case .getArticlesFromSource, .searchForArticles:
            return baseURL + "everything"
        }
    }
    
    var params: [String: String] {
        switch self {
        case .getTopHeadlines:
            return ["country": region]
            
        case let .getArticlesFromCategory(category):
            return ["country": region, "category": category]
            
        case .getSources:
            return ["language": locale, "country": region]
            
        case let .getArticlesFromSource(source):
            return ["sources": source, "language": locale]
            
        case let .searchForArticles(searchFilter):
            return ["q": searchFilter, "language": locale]
        }
    }
    
    var headers: [String: String] {
        return [
            "X-Api-Key": Container.newsAPIKey,
            "Content-type": "application/json",
            "Accept": "application/json"
        ]
    }
}
