//
//  BaseResponse.swift
//  BlockWallet-iOS
//
//  Created by Zsolt Pete on 2019. 03. 25..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseResponse: Mappable, IdentificableModel {
    
    var id: String
    
    required init?(map: Map) {
        self.id = ""
    }
    
    init?() {
       self.id = ""
    }
    
    func mapping(map: Map) {
        
    }
}
