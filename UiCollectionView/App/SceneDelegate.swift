//
//  SceneDelegate.swift
//  UiCollectionView
//
//  Created by Arthur Sh on 01.02.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let viewControllerMovie = MovieViewController()
        let viewControllerCompostional = MovieSecondViewController()
        let navigation = UINavigationController(rootViewController: viewControllerCompostional)
        
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }

}

