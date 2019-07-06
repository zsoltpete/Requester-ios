//
//  ErrorManager.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 06..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import UIKit

class ErrorManager {
    
    static let shared = ErrorManager()
    
    private init() {
        
    }
    
    func showDefaultErrorPopUp(_ agreeButtonAction: DefaultCompletion? = nil) {
        let model = RPopUpModel(title: "Error", messages: ["Cannot send the invation email. Please try again later…"], buttons: ["OK"])
        let view = RPopUpView(frame:
            AppDelegate.shared.guardWindow.frame)
        view.setAgreeCompletition(agreeButtonAction)
        view.bind(model)
        view.updateHeight()
        AppDelegate.shared.guardWindow.addSubview(view)
        view.animateIn()
        
    }
    
}
