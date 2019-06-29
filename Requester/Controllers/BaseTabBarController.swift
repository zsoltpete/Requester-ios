//
//  BaseTabBarController.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 29..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.styleUI()
    }
    
    @objc func styleUI() {
        self.setTitle()
        self.setBackgroundColor()
    }
    
    func setBackgroundColor() {
        self.tabBar.theme.backgroundColor = themed {
            $0.backgroundColor
        }
        
        self.tabBar.theme.barTintColor = themed {
            $0.backgroundColor
        }
        
        self.tabBar.shadowImage = UIImage()
        self.tabBar.backgroundImage = UIImage()
    }
    
    func setTitle() {
        self.tabBar.theme.tintColor = themed {
            $0.primaryTextColor
        }
    }

}
