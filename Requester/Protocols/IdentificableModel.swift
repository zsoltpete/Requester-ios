//
//  IdentificableModel.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 30..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//
//swiftlint:disable force_unwrapping

import Foundation
import ObjectMapper

protocol IdentificableModel: Mappable {
    
    var id: String { get set }
    
    init(id: String, JSON: [String: Any])
    
}

extension IdentificableModel where Self: Mappable {
    
    init(id: String, JSON: [String: Any]) {
        self.init(JSON: JSON)!
        self.id = id
    }
    
}
