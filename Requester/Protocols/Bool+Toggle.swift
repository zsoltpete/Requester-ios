//
//  Bool+Toggle.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 07..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

extension Bool {
    
    //
    mutating func toggle() {
        let oldValue = self
        self = !oldValue
    }

}
