//
//  UIButton+Modifiers.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 30..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

extension UIButton {
    
    ///Create RButton style for UIButton
    func addRButtonModifier() {
        self.theme.backgroundColor = themed {
            $0.buttonBackgroundColor
        }
        self.theme.tintColor = themed {
            $0.backgroundColor
        }
        self.layer.theme.borderColor = themed {
            $0.borderColor.cgColor
        }
        self.layer.borderWidth = 1.0.pps
        self.layer.cornerRadius = 15.0.pps
        self.titleLabel?.font = FontDeliver.system(sizeOf: 22.0.pps)
    }
    
}
