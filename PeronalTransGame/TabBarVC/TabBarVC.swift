//
//  TabBarVC.swift
//  PersonalTransGame
//
//  Created by Ирина Кольчугина on 15.04.2022.
//

import Foundation
import UIKit

class TabBarVC: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTabBar()
        selectedIndex = 1
    }

    static func getTranslateTabBarItem() -> UIViewController {
        let translateVC = TranslateVC()
        let translateItem = UITabBarItem(
            title: "Translate",
            image: UIImage(named: ""),
            selectedImage: UIImage(named: "")
        )
        translateItem.tag = 1
        translateVC.tabBarItem = translateItem
        return translateVC
    }

    static func getGameTabBarItem() -> UIViewController {
        let gameVC = GameVC()
        let gameItem = UITabBarItem(
            title: "Game",
            image: UIImage(named: ""),
            selectedImage: UIImage(named: "")
        )
        gameItem.tag = 0
        gameVC.tabBarItem = gameItem
        return gameVC
    }

    static func getSettingsTabBarItem() -> UIViewController {
        let settingsVC = SettingsVC()
        let navBar = UINavigationController()
        let settingsItem = UITabBarItem(
            title: "Settings",
            image: UIImage(named: ""),
            selectedImage: UIImage(named: "")
        )
        settingsItem.tag = 2
        navBar.viewControllers = [settingsVC]
        navBar.tabBarItem = settingsItem
        return navBar
    }

    private func setupTabBar() {
        let gameVC = Self.getGameTabBarItem()
        let translateVC = Self.getTranslateTabBarItem()
        let settingsVC = Self.getSettingsTabBarItem()

        let controllers = [gameVC, translateVC, settingsVC]
        self.viewControllers = controllers
    }

}
