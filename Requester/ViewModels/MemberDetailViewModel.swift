//
//  MemberDetailViewModel.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 30..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class MemberDetailViewModel {
    
    private let disposeBag = DisposeBag()
    var viewState = BehaviorRelay<User>(value: User())
    private var service: MemberDetailService
    
    init(service: MemberDetailService) {
        self.service = service
    }
    
    func updateViewState(_ model: User) {
        self.viewState.accept(model)
    }
    
    func fetch(userId: String) {
        self.service.fetchUser(id: userId).subscribe(onSuccess: { [weak self]response in
            self?.updateViewState(response)
        }).disposed(by: disposeBag)
    }
    
}
