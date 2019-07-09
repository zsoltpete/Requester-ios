//
//  MoralItem.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 01..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import ObjectMapper

class MoralItem: BaseResponse, Encodable {
    
    var codeReview: Int?
    var help: Int?
    var meetings: Int?
    
    required init(map: Map) {
        super.init(map: map)
    }
    
    override init() {
        super.init()
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        codeReview <- map["code_review"]
        help <- map["help"]
        meetings <- map["meetings"]
    }
    
}
