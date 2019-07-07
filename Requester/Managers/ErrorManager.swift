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
    
    func showSessionOverPopUp(_ agreeButtonAction: DefaultCompletion? = nil, disagreeCompletiton: DefaultCompletion? = nil, neverCompletition: DefaultCompletion? = nil) {
        let model = RPopUpModel(title: "Session is Over", messages: ["If session was successfully please tap on yes, if it’s happing no, if it won’t be done then never complete"], buttons: ["YES,  it’s over", "NO, not yet", "NEVER COMPLETE"])
        let view = RPopUpView(frame:
            AppDelegate.shared.guardWindow.frame)
        view.setAgreeCompletition(agreeButtonAction)
        view.setDisagreeCompletition(disagreeCompletiton)
        view.setNeverCompletition(neverCompletition)
        view.bind(model)
        view.updateHeight()
        AppDelegate.shared.guardWindow.addSubview(view)
        view.animateIn()
        
    }
    
}
