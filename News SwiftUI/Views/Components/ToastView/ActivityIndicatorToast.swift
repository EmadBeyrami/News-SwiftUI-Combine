//
//  File.swift
//
//
//  Created by אילי זוברמן on 14/02/2021.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        
        let progressView = UIActivityIndicatorView(style: .large)
        progressView.startAnimating()
        
        return progressView
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
    }
}
