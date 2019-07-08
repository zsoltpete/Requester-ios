//
//  MemberListMViewPresenter.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 29..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class MemberListMViewPresenter: BasePresenter {
    
    let disposeBag = DisposeBag()
    
    private var view: MemberListMViewContract
    private var viewModel: MemberListViewModel
    
    init(view: MemberListMViewContract, viewModel: MemberListViewModel) {
        self.viewModel = viewModel
        self.view = view
        super.init()
        self.initSubscriptions()
        self.addSelectionAction()
    }
    
    override func presenterWillAppear() {
        super.presenterWillAppear()
        self.viewModel.fetch()
    }
    
    private func initSubscriptions() {
        self.viewModel.viewState.subscribe(onNext: { [weak self]value in
            self?.handleViewState(value)
        }).disposed(by: disposeBag)
    }
    
    private func addSelectionAction() {
        self.view.setDidSelectionAction { model in
            NotificationCenter.default.post(name: Events.ShowMemberDetailView, object: model)
        }
    }
    
}

extension MemberListMViewPresenter: Presentable {
    
    func handleViewState(_ state: [MoralledItemCellBindable]) {
        self.view.updateList(state)
    }
    
}
