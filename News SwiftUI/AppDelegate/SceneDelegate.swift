//
//  SceneDelegate.swift
//  News SwiftUI
//
//  Created by Emad Bayramy on 7/17/21.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UIHostingController(rootView: TabedView())
        window?.makeKeyAndVisible()
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // MARK: - Save Data Before closing app
        CoreDataManager.shared.saveContext()
    }
}

