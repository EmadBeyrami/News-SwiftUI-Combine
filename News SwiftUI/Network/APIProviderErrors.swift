//
//  APIProviderErrors.swift
//  News
//
//  Created by Emad Bayramy on 7/16/21.
//

import Foundation

enum APIProviderErrors: LocalizedError {
    case invalidURL
    case dataNil
    case decodingError
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .dataNil:
            return "Empty data.".localized
        case .decodingError:
            return "Data has invalid format.".localized
        default:
            return "Something goes wrong.".localized
        }
    }
}
