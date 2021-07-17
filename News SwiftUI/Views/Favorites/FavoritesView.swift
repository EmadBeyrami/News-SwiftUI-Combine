//
//  FavoritesView.swift
//  News SwiftUI
//
//  Created by Emad Bayramy on 7/17/21.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: LocalArticle.entity(), sortDescriptors: [
        NSSortDescriptor(key: "savingDate", ascending: false)
    ]) var articles: FetchedResults<LocalArticle>
    @State var shouldPresent: Bool = false
    @State var articleURL: URL?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center) {
                    ForEach(articles, id: \.self) { article in
                        LocalArticleRow(article: article)
                            .animation(.spring())
                            .onTapGesture {
                                self.articleURL = article.url
                                self.shouldPresent = true
                            }
                    }
                }
            }
            .navigationBarTitle(Text(Constants.title), displayMode: .automatic)
            .sheet(isPresented: $shouldPresent) {
                SafariView(url: self.articleURL!)
            }
        }
    }
}

private extension FavoritesView {
    
    struct Constants {
        static let title = "Favorites".localized
    }
}
