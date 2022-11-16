//
//  MainTabBarController.swift
//  VoteApp
//
//  Created by 上條栞汰 on 2022/10/25.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    private lazy var homeVC = templateNavigationController(selectedImage: "house.fill", unSelectedImage: "house", rootViewController: HomeViewController())
    private lazy var profileVC = templateNavigationController(selectedImage: "person.fill", unSelectedImage: "person", rootViewController: ProfileViewController())
    private lazy var settingVC = templateNavigationController(selectedImage: "gearshape.fill", unSelectedImage: "gearshape", rootViewController: SettingViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers([homeVC, profileVC, settingVC], animated: true)
    }
    
    private func templateNavigationController(selectedImage: String, unSelectedImage: String, rootViewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.selectedImage = UIImage(systemName: selectedImage)
        navigationController.tabBarItem.image = UIImage(systemName: unSelectedImage)
        return navigationController
    }
}
