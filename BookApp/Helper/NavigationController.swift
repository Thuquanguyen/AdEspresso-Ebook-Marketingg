//
//  NavigationController.swift
//  BookApp
//
//  Created by Ngoc The on 1/20/21.
//  Copyright © 2021 Ngoc The. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNav()
    }
    
    private func setupNav() {
        let appearance = UIBarButtonItem.appearance()
        appearance.setBackButtonTitlePositionAdjustment(UIOffset.init(horizontal: 0.0, vertical: 0.0), for: .default)
        self.navigationBar.isTranslucent = true
        self.navigationBar.barTintColor = .white
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        self.navigationBar.tintColor = .black
    }
}
