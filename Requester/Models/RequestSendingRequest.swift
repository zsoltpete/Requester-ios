//
//  RequestSendingRequest.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 09..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import ObjectMapper

class RequestSendingRequest: BaseResponse, Encodable {
    
    var message: String = ""
    var categoryId: String = ""
    
    init(message: String, categoryId: String) {
        self.message = message
        self.categoryId = categoryId
        super.init()
    }
    
    required init(map: Map) {
        super.init(map: map)
    }
    
    override init() {
        super.init()
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["id"]
        message <- map["message"]
        categoryId <- map["categoryId"]
    }
    
}
