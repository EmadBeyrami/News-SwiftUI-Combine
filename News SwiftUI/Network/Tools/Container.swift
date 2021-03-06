//
//  Container.swift
//  News
//
//  Created by Emad Bayramy on 7/16/21.
//

import Foundation

class Container {
    // MARK: - JsonDecoder
    static let jsonDecoder: JSONDecoder = JSONDecoder()

    static var weatherJSONDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .secondsSince1970
        return jsonDecoder
    }()
    
    // MARK: - API KEYS
    /// News API key url: https://newsapi.org
    #warning("Add Your API Key Here")
    static let newsAPIKey: String = "YOUR_API_KEY"
}
