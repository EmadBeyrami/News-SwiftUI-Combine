//
//  Container.swift
//  News
//
//  Created by Emad Bayramy on 7/16/21.
//

import Foundation

class Container {
    static let jsonDecoder: JSONDecoder = JSONDecoder()

    static var weatherJSONDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .secondsSince1970
        return jsonDecoder
    }()
    
    /// News API key url: https://newsapi.org
    static let newsAPIKey: String = "41b80496dac04f0383ce1787a4147e8a"
}
