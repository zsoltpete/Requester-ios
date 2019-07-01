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
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override init?() {
        super.init()
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        icon <- map["icon"]
        name <- map["name"]
    }
    
}
