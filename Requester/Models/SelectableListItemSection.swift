//
//  SelectableListItemWrapper.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 07..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

class SelectableListItemSection {
    
    var title: String
    var items: [SelectableListItem]
    
    init(title: String, items: [SelectableListItem]) {
        self.title = title
        self.items = items
    }
    
    init() {
        self.title = ""
        self.items = []
    }
    
}
