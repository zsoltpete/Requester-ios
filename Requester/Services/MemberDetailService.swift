//
//  MemeberDetailService.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 30..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class MemberDetailService: FirDataServiceProvider {
    
    func fetchUser(id: String) -> Single<User> {
        let endPoint = "users/" + id
        return self.firRequest(endPoint: endPoint)
    }
    
}
