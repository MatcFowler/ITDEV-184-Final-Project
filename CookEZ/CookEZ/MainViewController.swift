//
//  ViewController.swift
//  CookEZ
//
//  Created by Admin on 3/25/24.
//



import UIKit
import SwiftUI

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
        
    }

    private func setupViews() {
        let cookBookVC = CookBookViewController()
        let browsingVC = BrowsingViewController()
        let settingsVC = SettingsViewController()

        cookBookVC.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Book")
        browsingVC.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Browser")
        settingsVC.setTabBarImage(imageName: "ellipsis.circle", title: "Setting")

        let cookBookNC = UINavigationController(rootViewController: cookBookVC)
        let browsingNC = UINavigationController(rootViewController: browsingVC)
        let settingsNC = UINavigationController(rootViewController: settingsVC)

        cookBookNC.navigationBar.barTintColor = appColorMain
        hideNavigationBarLine(cookBookNC.navigationBar)
        
        let tabBarList = [cookBookNC, browsingNC, settingsNC]
                   
        viewControllers = tabBarList
        
    }
    
    private func hideNavigationBarLine(_ navigationBar: UINavigationBar) {
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    private func setupTabBar() {
        tabBar.tintColor = appColorMain
        tabBar.isTranslucent = false
    }
    
}

