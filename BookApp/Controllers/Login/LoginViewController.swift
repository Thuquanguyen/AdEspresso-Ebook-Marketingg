//
//  LoginViewController.swift
//  BookApp
//
//  Created by Ngoc The on 2/23/21.
//  Copyright © 2021 Ngoc The. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class LoginViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var facebookView: UIView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    
    // MARK: - Init view
    private func setupViews() {
        facebookView.layer.cornerRadius = 6
        
        let tapLogin = UITapGestureRecognizer(target: self, action: #selector(loginFacebook))
        facebookView.isUserInteractionEnabled = true
        
        facebookView.addGestureRecognizer(tapLogin)
    }
    
    @objc func loginFacebook() {
        let webVC = WebViewController()
        webVC.openMainScreen = {
            self.openMainScreen()
        }
        self.present(webVC, animated: true, completion: nil)
    }
    
    private func openMainScreen() {
        let tabBarVC = ESTabBarController()
        
        let homeVC = HomeViewController()
        let searchVC = SearchBookViewController()
        
        homeVC.tabBarItem = ESTabBarItem.init(title: "Home", image: UIImage(named: "ic_home"), selectedImage: UIImage(named: "ic_home_selected"))
        searchVC.tabBarItem = ESTabBarItem.init(title: "Search", image: UIImage(named: "ic_search"), selectedImage: UIImage(named: "ic_search"))
        
        tabBarVC.viewControllers = [homeVC, searchVC]
        let naviVC = NavigationController(rootViewController: tabBarVC)
        naviVC.modalPresentationStyle = .fullScreen
        
        self.present(naviVC, animated: true, completion: nil)
    }
}
