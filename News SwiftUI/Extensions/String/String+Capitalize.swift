//
//  String+Capitalize.swift
//  News
//
//  Created by Emad Bayramy on 7/16/21.
//

import Foundation

extension String {
    // MARK: Capitalize first letter
    func capitalizeFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
}
