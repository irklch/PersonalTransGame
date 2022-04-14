//
//  TapBarVC.swift
//  PersonalTransGame
//
//  Created by Ирина Кольчугина on 15.04.2022.
//

import Foundation
import UIKit

class TapBarVC: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let translateVC = TranslateVC()
        let translateIcon = UITabBarItem(title: "Translate", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        translateVC.tabBarItem = translateIcon

        let gameVC = GameVC()
        let gameIcon = UITabBarItem(title: "Game", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        gameVC.tabBarItem = gameIcon

        let settingsVC = SettingsVC()
        let settingsIcon = UITabBarItem(title: "Settings", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        settingsVC.tabBarItem = settingsIcon


        let controllers = [translateVC, gameVC, settingsVC]
        self.viewControllers = controllers
    }

    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true
    }
}
