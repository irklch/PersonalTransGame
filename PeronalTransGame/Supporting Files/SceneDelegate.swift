//
//  SceneDelegate.swift
//  PeronalTranslGame
//
//  Created by Ирина Кольчугина on 15.04.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        window = UIWindow(frame: UIScreen.main.bounds)

        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

        let tabBarVC = TabBarVC()

        window?.backgroundColor = .white
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window?.windowScene = windowScene
    }


}

