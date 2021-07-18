//
//  TopHeadlinesView.swift
//  News
//
//  Created by Emad Bayramy on 7/16/21.
//

import SwiftUI

struct TopHeadlinesView : View {
    let topHeadlines: Articles
    
    var body: some View {
        PageView(topHeadlines.map { TopHeadlineRow(article: $0) })
    }
}


struct TopHeadlinesView_Previews: PreviewProvider {
    static var previews: some View {
        TopHeadlinesView(topHeadlines: Articles())
    }
}
