//
//  HomeView.swift
//  News
//
//  Created by Emad Bayramy on 7/16/21.
//

import SwiftUI

struct MainView : View {
    @ObservedObject var viewModel = MainViewModel()
    
    private var categories: [String] = ["business", "entertainment", "general", "health", "science", "sports", "technology"]
    
    var body: some View {
        NavigationView(content: {
            mainViewList
                .animation(.spring())
                .onAppear(perform: {
                    self.viewModel.getTopHeadlines()
                })
                .navigationBarTitle(Text("Overview".localized), displayMode: .large)
                .navigationBarItems(trailing:
                    Button(
                        action: {
                            self.viewModel.getTopHeadlines()
                        },
                        label: {
                            Image(systemName: "arrow.2.circlepath")
                                .accentColor(Color("BlackColor"))
                                .imageScale(.medium)
                        }
                    )
                )
        })
    }
    
    private var mainViewList: some View {
        List {
            if viewModel.topHeadlines.isEmpty {
                ActivityIndicator()
            } else {
                TopHeadlinesView(topHeadlines: viewModel.topHeadlines)
                    .frame(height: UIScreen.main.bounds.width / 4 * 3,
                           alignment: .center)
                    .clipped()
                    .listRowInsets(EdgeInsets())
            }
            
            Section(header: Text(verbatim: "Categories".localized)) {
                ForEach(categories, id: \.self) { category in
                    NavigationLink(
                        destination: ArticlesFromCategoryView(category: category)
                            .navigationBarTitle(Text(category.localized.capitalizeFirstLetter()), displayMode: .large)
                    ) {
                        Text(category.localized.capitalizeFirstLetter())
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
    }
}


