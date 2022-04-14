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
//        guard let scene = (scene as? UIWindowScene) else { return }
//        let window = UIWindow(windowScene: scene)
//        window.rootViewController = ViewController()
//        window.makeKeyAndVisible()
//
//        self.window = window

        window = UIWindow(frame: UIScreen.main.bounds)

        let navVc = UINavigationController()

        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

//        let vc = TranslateVC()
        let tapBarVC = TapBarVC()
        navVc.viewControllers = [tapBarVC]

        window?.backgroundColor = .white
        window?.rootViewController = navVc
        window?.makeKeyAndVisible()

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window?.windowScene = windowScene
    }


}

