//
//  RPopUpModel.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 05..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

class RPopUpModel {
    
    var title:  String
    var messages: [String]
    var buttons: [String]
    var type: RPopUpFooterType

    init(title: String, messages: [String], buttons: [String]) {
        self.title = title
        self.messages = messages
        self.buttons = buttons
        if buttons.count <= 1 {
            self.type = .one
        } else {
            self.type = .three
        }
    }
    
}

extension RPopUpModel: RPopUpViewBindable {
    
    var pType: RPopUpFooterType {
        return self.type
    }
    
    var pButtons: [String] {
        return self.buttons
    }
    
    var pTitle: String {
        return self.title
    }
    
    var pMessages: [String] {
        return self.messages
    }
    
}
