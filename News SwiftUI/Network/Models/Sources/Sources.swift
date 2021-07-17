//
//  Sources.swift
//  News
//
//  Created by Emad Bayramy on 7/16/21.
//

import Foundation

typealias Sources = [Source]

struct Source: Codable, Hashable {
    let id: String
    let name: String
    let description: String?
    let url: URL
    let category: String
    let language: String
    let country: String
}
