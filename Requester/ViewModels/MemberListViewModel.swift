//
//  MemberListViewModel.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 29..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class MemberListViewModel {
    
    private let disposeBag = DisposeBag()
    var viewState = BehaviorRelay<[MemberListItemCellBindable]>(value: [])
    private var service: MemberListService
    
    init(service: MemberListService) {
        self.service = service
    }
    
    func updateViewState(_ model: [MemberListItemCellBindable]) {
        self.viewState.accept(model)
    }
    
    func fetch() {
        self.service.fetchAllUser().subscribe(onSuccess: { [weak self]response in
            self?.updateViewState(response)
        }).disposed(by: disposeBag)
    }
    
}
