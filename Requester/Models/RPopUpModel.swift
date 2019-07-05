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

    init(title: String, messages: [String], buttons: [String]) {
        self.title = title
        self.messages = messages
        self.buttons = buttons
    }
    
}

extension RPopUpModel: RPopUpViewBindable {
    
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
