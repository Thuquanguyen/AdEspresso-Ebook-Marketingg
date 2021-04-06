//
//  AppDelegate.swift
//  BookApp
//
//  Created by Ngoc The on 1/20/21.
//  Copyright © 2021 Ngoc The. All rights reserved.
//

import UIKit
import ESTabBarController_swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    static var shared = UIApplication.shared.delegate as! AppDelegate
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        let launchVC = LaunchViewController()
        window?.rootViewController = launchVC
        
        CallAPI.shared.getFlagLogin(completion: { [weak self] (isLogin) in
            if isLogin {
                self?.requireLogin(aView: launchVC.view)
            } else {
                self?.openMainScreen()
            }
        })
        
        
        return true
    }

    private func requireLogin(aView: UIView) {
        BookDataModel.shared.checkCookies(aView: aView) { [weak self] (isCheck) in
            // Have account FB
            if isCheck {
                self?.openMainScreen()
            } else {
                let loginVC = LoginViewController()
                self?.window?.rootViewController = loginVC
                self?.window?.makeKeyAndVisible()
            }
        }
    }
    
    private func openMainScreen() {
        let tabBarVC = ESTabBarController()
        
        let homeVC = HomeViewController()
        let searchVC = SearchBookViewController()
        
        homeVC.tabBarItem = ESTabBarItem.init(title: "Home", image: UIImage(named: "ic_home"), selectedImage: UIImage(named: "ic_home_selected"))
        searchVC.tabBarItem = ESTabBarItem.init(title: "Search", image: UIImage(named: "ic_search"), selectedImage: UIImage(named: "ic_search"))
        
        tabBarVC.viewControllers = [homeVC, searchVC]
        let naviVC = NavigationController(rootViewController: tabBarVC)
        
        window?.rootViewController = naviVC
        window?.makeKeyAndVisible()
    }
}

