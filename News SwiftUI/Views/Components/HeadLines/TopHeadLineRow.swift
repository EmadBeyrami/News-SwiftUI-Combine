//
//  TopHeadLineRow.swift
//  News
//
//  Created by Emad Bayramy on 7/16/21.
//

import SwiftUI

import Combine
import KingfisherSwiftUI
import SwiftUI

struct TopHeadlineRow : View {
    @State private var shouldPresentURL: Bool = false
    @State private var shouldShowShareSheet: Bool = false
    
    var article: Article
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(URL(string: article.urlToImage ?? ""))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width - 32,
                       height: UIScreen.main.bounds.width / 4 * 3,
                       alignment: .center)
                .scaledToFit()
            
            Rectangle()
                .foregroundColor(NewsColor.BackGround.blackWhite)
                .blur(radius: 50, opaque: true)
                .opacity(0.6)
                .frame(width: UIScreen.main.bounds.width - 32,
                       height: UIScreen.main.bounds.width / 4 * 3,
                       alignment: .center)
                .cornerRadius(15)
            
            Button(
                action: {
                    self.shouldPresentURL = true
                },
                label: {
                    topHeadlineInfo
                }
            )
        }
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
        .sheet(isPresented: $shouldPresentURL) {
            SafariView(url: self.article.url)
        }
        .sheet(isPresented: $shouldShowShareSheet) {
            ActivityViewController(activityItems: [
                self.article.title ?? "",
                self.article.url
            ])
        }
    }
    
    private var topHeadlineInfo: some View {
        VStack(alignment: .leading) {
            Text(verbatim: article.source?.name ?? "")
                .foregroundColor(NewsColor.BackGround.whiteBlack)
                .font(.subheadline)
                .lineLimit(nil)
                .padding([.leading, .trailing])
            
            Text(verbatim: article.title ?? "")
                .foregroundColor(NewsColor.BackGround.whiteBlack)
                .font(.headline)
                .lineLimit(nil)
                .padding([.leading, .bottom, .trailing])
        }
    }
}
