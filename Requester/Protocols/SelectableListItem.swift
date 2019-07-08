//
//  SelectableListItem.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 07..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

///SelectableList item
protocol SelectableListItem {
    
    var pTitle: String { get }
    var pSelected: Bool { get }
}
