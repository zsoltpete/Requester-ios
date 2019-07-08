//
//  UITextView+Modifiers.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 08..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

extension UITextView {
    
    func addModifier() {
        self.theme.textColor = themed {
            $0.primaryTextColor
        }
    }
    
}
