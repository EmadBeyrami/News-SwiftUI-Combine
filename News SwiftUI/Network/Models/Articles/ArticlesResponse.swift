//
//  ArticlesResponse.swift
//  News
//
//  Created by Emad Bayramy on 7/16/21.
//

import Foundation

struct ArticlesResponse: Codable {
    let status: String
    let articles: Articles
}
