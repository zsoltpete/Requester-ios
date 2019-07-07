//
//  MemberDetailViewPresenter.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 30..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import CYLocalization
import Foundation
import RxCocoa
import RxSwift

class MemberDetailViewPresenter: BasePresenter {
    
    let disposeBag = DisposeBag()
    
    private var view: MemberDetailMViewContract
    private var viewModel: MemberDetailViewModel
    private var userId: String
    
    init(view: MemberDetailMViewContract, viewModel: MemberDetailViewModel, userId: String) {
        self.viewModel = viewModel
        self.view = view
        self.userId = userId
        super.init()
        self.initSubscriptions()
    }
    
    override func presenterDidLoad() {
        super.presenterDidLoad()
        self.view.bindRequestButton("MemberDetail.RequestButton.Title".localized)
        self.view.setRequestButtonAction {
            ErrorManager.shared.showSessionOverPopUp()
        }
    }
    
    override func presenterWillAppear() {
        super.presenterWillAppear()
        self.viewModel.fetch(userId: userId)
    }
    
    private func initSubscriptions() {
        self.viewModel.viewState.subscribe(onNext: { [weak self]value in
            self?.handleViewState(value)
        }).disposed(by: disposeBag)
    }
    
}

extension MemberDetailViewPresenter: Presentable {
    
    func handleViewState(_ state: User) {
        self.view.updateMoralList("MemberDetail.SectionHeader.Title".localized, dataSource: state.moralList ?? [])
        self.view.setTeamName(state.pName)
        self.view.setProfileImageView(state.pImageSrc)
    }
    
}
