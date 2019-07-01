//
//  BaseNavigationController.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 29..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

protocol NavigationControllerStyler {
    
    func setTitle()
    func setBackButton()
    func setBackgroundColor()
    func setLargeTitle()
    
}

class BaseNavigationController: UINavigationController, NavigationControllerStyler {
    
    func setBackgroundColor() {
        self.navigationBar.theme.barTintColor = themed {
            $0.backgroundColor
        }
        self.navigationBar.theme.backgroundColor = themed {
            $0.backgroundColor
        }
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = false
        self.view.theme.backgroundColor = themed {
            $0.backgroundColor
        }
    }
    
    func setBackButton() {
        self.navigationBar.theme.tintColor = themed {
            $0.primaryTextColor
        }
    }
    
    func setLargeTitle() {
        self.navigationBar.largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: Colors.PrimaryTextColor.light/*,
                 NSAttributedString.Key.font: NavigationControllerTheme.Fonts.LargeNavBarTitle*/]
    }
    
    func setTitle() {
        self.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: Colors.PrimaryTextColor.light]
    }
    
    @objc func styleUI() {
        self.setTitle()
        self.setBackButton()
        self.setBackgroundColor()
        self.setLargeTitle()
        self.navigationBar.prefersLargeTitles = true
    }
    
    func setNavBarDelegate(delegate: UINavigationBarDelegate) {
        self.navigationBar.delegate = delegate
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.styleUI()
    }
    
}
