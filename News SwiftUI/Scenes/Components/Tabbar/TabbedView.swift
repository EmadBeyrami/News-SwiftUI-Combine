//
//  TabbedView.swift
//  News SwiftUI
//
//  Created by Emad Bayramy on 7/17/21.
//

import SwiftUI

// MARK: TabbarView
struct TabedView : View {
    private let context = CoreDataManager.shared.managedObjectContext
    
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "globe")
                        .font(.system(size: 22))
                }
            
            SourcesListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                        .font(.system(size: 22))
                }
            
            SearchForArticlesView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 22))
                }
            
            FavoritesView()
                .environment(\.managedObjectContext, context)
                .tabItem {
                    Image(systemName: "heart.fill")
                        .font(.system(size: 22))
                }
        }
        .accentColor(NewsColor.BackGround.blueWhite)
    }
}
