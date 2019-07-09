//
//  Category.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 01..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import ObjectMapper

class Category: BaseResponse, Encodable {
    
    var icon: String?
    var name: String?
    var selected: Bool = false
    
    required init(map: Map) {
        super.init(map: map)
    }
    
    override init() {
        super.init()
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        icon <- map["icon"]
        name <- map["name"]
    }
    
}

extension Category: SelectableListItem {
    
    var pTitle: String {
        return self.name ?? ""
    }
    
    var pSelected: Bool {
        return selected
    }
}
