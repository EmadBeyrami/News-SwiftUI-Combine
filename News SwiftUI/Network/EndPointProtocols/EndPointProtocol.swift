//
//  EndPointProtocol.swift
//  News
//
//  Created by Emad Bayramy on 7/16/21.
//

import Foundation
// MARK: - EndPoint Protocol
protocol EndpointProtocol {
    var locale: String { get }
    
    var region: String { get }
    
    var baseURL: String { get }
    
    var absoluteURL: String { get }
    
    var params: [String: String] { get }
    
    var headers: [String: String] { get }
}

// MARK: - Trait for setting user Language and Region for Api Calls
extension EndpointProtocol {
    var locale: String {
        return Locale.current.languageCode ?? "en"
    }
    
    var region: String {
        return Locale.current.regionCode ?? "us"
    }
}
