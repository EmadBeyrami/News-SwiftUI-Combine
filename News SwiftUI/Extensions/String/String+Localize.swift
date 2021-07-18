//
//  String+Localize.swift
//  News SwiftUI
//
//  Created by Emad Bayramy on 7/17/21.
//

import Foundation

extension String {
    // MARK: - Return Localized Value
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
