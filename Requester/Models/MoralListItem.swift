//
//  MoralListItem.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 01..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//
//swiftlint:disable force_unwrapping

import Foundation
import ObjectMapper

class MoralListItem: BaseResponse, Encodable {
    
    var name: String?
    var icon: String?
    var value: Int?
    
    init(category: Category, value: Int?) {
        super.init()!
        self.name = category.name
        self.icon = category.icon
        self.value = value
        
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override init?() {
        super.init()
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
    }
    
}

extension MoralListItem: MoralledItemCellBindable {
    
    var pId: String {
        return self.id
    }
    
    var pImageSrc: String {
        return self.icon ?? ""
    }
    
    var pName: String {
        return self.name ?? ""
    }
    
    var pMoralPercent: Int {
        return self.value ?? 0
    }
    
}
