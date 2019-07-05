//
//  RPopUpViewBindable.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 05..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

protocol RPopUpViewBindable {
    
    var pTitle: String { get }
    var pMessages: [String] { get }
    var pButtons: [String] { get }
    
}
