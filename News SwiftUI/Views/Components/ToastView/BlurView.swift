//
//  BlurView.swift
//  AlertToastPreview
//
//  Created by אילי זוברמן on 14/02/2021.
//

import Foundation
import SwiftUI

public struct BlurView: UIViewRepresentable {
    public typealias UIViewType = UIVisualEffectView
    
    public func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
    }
    
    public func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: .systemMaterial)
    }
}

