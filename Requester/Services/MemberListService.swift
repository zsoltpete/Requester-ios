//
//  MemberListService.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 29..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import CYExtensions
import FirebaseDatabase
import Foundation
import ObjectMapper
import RxCocoa
import RxSwift
import SwiftyJSON

class MemberListService: FirDataServiceProvider {
    
    func fetchAllUser() -> Single<[User]> {
        return self.firRequest(endPoint: "users")
    }
    
}
