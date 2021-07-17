//
//  ArticlesFromSourceView.swift
//  News SwiftUI
//
//  Created by Emad Bayramy on 7/17/21.
//

import SwiftUI

struct ArticlesFromSourceView: View {
    @ObservedObject var viewModel = ArticlesFromSourceViewModel()
    
    @State var shouldPresent: Bool = false
    @State var articleURL: URL?
    
    let source: Source
    
    var body: some View {
        mainView
            .onAppear(perform: {
                self.viewModel.getArticles(from: self.source.id)
            })
            .sheet(isPresented: $shouldPresent) {
                if let url = self.articleURL {
                    SafariView(url: url)
                } else {
                    AlertToast(displayMode: .alert,
                               type: .error(.red),
                               title: "Empty data.".localized,
                               subTitle: "")
                }
            }
            .navigationBarItems(trailing:
                HStack {
                    Button(
                        action: {
                            UIApplication.shared.open(self.source.url)
                        },
                        label: {
                            Image(systemName: "safari")
                                .imageScale(.large)
                        }
                    )
                }
            )
    }
    
    private var mainView: some View {
        VStack {
            if viewModel.articles.isEmpty {
                ActivityIndicatorNew()
                    .frame(width: UIScreen.main.bounds.width,
                           height: 50,
                           alignment: .center)
            } else {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center) {
                        if self.source.description != nil {
                            Text(verbatim: "About source:\n".localized + (source.description ?? ""))
                                .lineLimit(nil)
                                .frame(width: UIScreen.main.bounds.width - 32,
                                       height: 150,
                                       alignment: .center)
                        }
                        ForEach(viewModel.articles, id: \.self) { article in
                            ArticleRow(article: article)
                            .animation(.spring())
                            .onTapGesture {
                                self.articleURL = article.url
                                self.shouldPresent = true
                            }
                        }
                    }
                    .animation(.spring())
                }
            }
        }
    }
}
