//
//  String.swift
//  News
//
//  Created by Emad Bayramy on 7/16/21.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
