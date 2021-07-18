//
//  Bundle.swift
//  News
//
//  Created by Emad Bayramy on 7/16/21.
//

import Foundation

extension Bundle {
    // MARK: - read data from info Dictionary
    public func info(for key: String) -> String! {
        guard let value = infoDictionary?[key] else {
            return nil
        }
        return (value as! String).replacingOccurrences(of: "\\", with: "")
    }
    
    // MARK: - reads a file from dataManager
    public func read(fileName: String, type: String) -> String? {
        autoreleasepool {
            if let path = self.path(forResource: fileName, ofType: type) {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    return String(data: data, encoding: .utf8)
                } catch {
                    return nil
                }
            } else {
                return nil
            }
        }
    }
}
