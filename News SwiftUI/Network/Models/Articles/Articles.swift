//
//  Articles.swift
//  News
//
//  Created by Emad Bayramy on 7/16/21.
//

import Foundation

typealias Articles = [Article]

struct Article: Codable, Hashable {
    let source: ArticleSource?
    let author: String?
    let title: String?
    let description: String?
    let url: URL
    let urlToImage: String?
}
