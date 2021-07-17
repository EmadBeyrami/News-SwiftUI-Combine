//
//  ArticleRow.swift
//  News
//
//  Created by Emad Bayramy on 7/16/21.
//

import Combine
import KingfisherSwiftUI
import SwiftUI

struct ArticleRow : View {
    let article: Article
    
    @State private var shouldShowShareSheet: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(URL(string: article.urlToImage ?? ""))
                .renderingMode(.original)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width - 32,
                       height: 250,
                       alignment: .center)
            
            Rectangle()
                .foregroundColor(NewsColor.BackGround.blackWhite)
                .opacity(0.6)
            
            articleInfo
        }
        .cornerRadius(8)
        .padding([.leading, .trailing], 16)
        .padding([.top, .bottom], 8)
        .shadow(color: NewsColor.BackGround.lightGreyLightBlack, radius: 5, x: 0, y: 0)
        .contextMenu {
            Button(
                action: {
                    LocalArticle.saveArticle(self.article)
                    CoreDataManager.shared.saveContext()
                },
                label: {
                    Text("Add to favorites".localized)
                    Image(systemName: "heart.fill")
                }
            )
            Button(
                action: {
                    self.shouldShowShareSheet.toggle()
                },
                label: {
                    Text("Share".localized)
                    Image(systemName: "square.and.arrow.up")
                }
            )
        }
        .sheet(isPresented: $shouldShowShareSheet) {
            ActivityViewController(activityItems: [
                self.article.title ?? "",
                self.article.url
            ])
        }
    }
    
    private var articleInfo: some View {
        VStack {
            Text(verbatim: article.source?.name ?? "")
                .foregroundColor(NewsColor.BackGround.whiteBlack)
                .font(.subheadline)
                .lineLimit(nil)
                .padding([.leading, .trailing])
                .frame(width: UIScreen.main.bounds.width - 64,
                       alignment: .bottomLeading)
            
            Text(verbatim: article.title ?? "")
                .foregroundColor(NewsColor.BackGround.whiteBlack)
                .font(.headline)
                .lineLimit(nil)
                .padding([.leading, .bottom, .trailing])
                .frame(width: UIScreen.main.bounds.width - 64,
                       alignment: .bottomLeading)
        }
    }
}
