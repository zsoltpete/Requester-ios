//
//  User.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 29..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//
//swiftlint:disable force_unwrapping

import Foundation
import ObjectMapper

class User: BaseResponse, Encodable {
    
    var name: String?
    var imageSrc: String?
    var moralPercent: Int?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override init() {
        super.init()!
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["id"]
        name <- map["name"]
        imageSrc <- map["image_src"]
        moralPercent <- map["moral_value"]
    }
    
}

extension User: MoralledItemCellBindable {
    
    var pId: String {
        return self.id
    }
    
    var pImageSrc: String {
        return self.imageSrc ?? ""
    }
    
    var pName: String {
        return self.name ?? ""
    }
    
    var pMoralPercent: Int {
        return self.moralPercent ?? 0
    }
}
