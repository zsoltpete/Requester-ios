//
//  UIView+Modifiers.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 08..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

extension UIView {
    
    func addInputViewBorderModifiers() {
        self.layer.theme.borderColor = themed {
            $0.primaryTextColor.cgColor
        }
        self.layer.borderWidth = 1.0.pps
        self.layer.cornerRadius = 4.0.pps
    }
    
}

