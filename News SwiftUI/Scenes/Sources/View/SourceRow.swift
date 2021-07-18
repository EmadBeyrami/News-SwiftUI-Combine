//
//  SourceRow.swift
//  News SwiftUI
//
//  Created by Emad Bayramy on 7/17/21.
//


import SwiftUI

struct SourceRow : View {
    let source: Source
    
    var body: some View {
        HStack {
            Text(source.name)
        }
    }
}
