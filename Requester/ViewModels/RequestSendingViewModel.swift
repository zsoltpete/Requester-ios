//
//  RequestSendingViewModel.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 07..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class RequestSendingViewModel {
    
    private let disposeBag = DisposeBag()
    var viewState = BehaviorRelay<Any>(value: NSObject())
    private var service: RequestSendingService
    
    init(service: RequestSendingService) {
        self.service = service
    }
    
    func updateViewState(_ model: Any) {
        self.viewState.accept(model)
    }
    
}
