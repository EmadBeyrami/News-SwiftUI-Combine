//
//  SourcesListView.swift
//  News SwiftUI
//
//  Created by Emad Bayramy on 7/17/21.
//

import SwiftUI

struct SourcesListView : View {
    @ObservedObject var viewModel = SourcesListViewModel()
    
    var body: some View {
        NavigationView(content: {
            VStack {
                if viewModel.sources.isEmpty {
                    ActivityIndicatorNew()
                        .frame(width: UIScreen.main.bounds.width,
                               height: 50,
                               alignment: .center)
                } else {
                    List(viewModel.sources, id: \.self) { source in
                        NavigationLink(
                            destination: ArticlesFromSourceView(source: source)
                                .navigationBarTitle(Text(source.name)),
                            label: {
                                Text(source.name)
                            }
                        )
                    }
                    .listStyle(GroupedListStyle())
                    .environment(\.horizontalSizeClass, .regular)
                    .animation(.spring())
                }
            }
            .onAppear {
                self.viewModel.getSources()
            }
            .navigationBarTitle(Text("Sources".localized), displayMode: .large)
        })
    }
}
