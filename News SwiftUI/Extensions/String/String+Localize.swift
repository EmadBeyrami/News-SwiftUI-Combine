//
//  String+Localize.swift
//  News SwiftUI
//
//  Created by Emad Bayramy on 7/17/21.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
