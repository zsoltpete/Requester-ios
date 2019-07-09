//
//  RequestSendingService.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 07..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class RequestSendingService: FirDataServiceProvider {
    
    ///Send request
    func sendRequest(_ request: RequestSendingRequest) -> Completable {
        let endPoint = "notifications/"
        return self.firPostRequest(endPoint: endPoint, postData: request)
    }
    
}
