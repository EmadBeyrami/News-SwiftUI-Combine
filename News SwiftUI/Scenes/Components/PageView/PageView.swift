//
//  PageView.swift
//  News
//
//  Created by Emad Bayramy on 7/16/21.
//

import SwiftUI

struct PageView<Page: View>: View {
    private let viewControllers: [UIHostingController<Page>]
    
    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }
    
    var body: some View {
        PageViewController(controllers: viewControllers).accentColor(.clear)
    }
}
