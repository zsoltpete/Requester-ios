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
    
    func addPopUpButtonModifier() {
        self.theme.tintColor = themed {
            $0.primaryTextColor
        }
        self.titleLabel?.font = FontDeliver.boldSystem(sizeOf: 16.0.pps)
    }
    
    func addPopUpNeverButtonModifier() {
        self.theme.tintColor = themed {
            $0.lowPercentColor
        }
        self.titleLabel?.font = FontDeliver.boldSystem(sizeOf: 16.0.pps)
    }
    
    func addPopUpAgreeButtonModifier() {
        self.theme.tintColor = themed {
            $0.highPercentColor
        }
        self.titleLabel?.font = FontDeliver.boldSystem(sizeOf: 16.0.pps)
    }
    
}
