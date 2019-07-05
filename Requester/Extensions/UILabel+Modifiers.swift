//
//  UILabel+Modifiers.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 30..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

extension UILabel {
    
    func addSectionHeaderModifier() {
        self.theme.textColor = themed {
            $0.primaryTextColor
        }
        self.font = FontDeliver.semiBoldSystem(sizeOf: 17.0.pps)
    }
    
    func addPopUpHeaderModifier() {
        self.numberOfLines = 0
        self.theme.textColor = themed {
            $0.primaryTextColor
        }
        self.font = FontDeliver.semiBoldSystem(sizeOf: 24.0.pps)
    }
    
    func addPopUpMessageModifier() {
        self.numberOfLines = 0
        self.theme.textColor = themed {
            $0.primaryTextColor
        }
        self.font = FontDeliver.system(sizeOf: 16.0.pps)
    }
    
}
