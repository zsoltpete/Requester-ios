//
//  RequestSendingPresenter.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 07..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import CYExtensions
import RxCocoa
import RxSwift
import UIKit

class RequestSendingPresenter: BasePresenter {
    
    private let disposeBag = DisposeBag()
    
    private var view: RequestSendingContract
    private var viewModel: RequestSendingViewModel
    
    init(view: RequestSendingContract, viewModel: RequestSendingViewModel) {
        self.viewModel = viewModel
        self.view = view
        super.init()
    }
    
    override func presenterDidLoad() {
        super.presenterDidLoad()
        let section = SelectableListItemSection(title: "Category", items: CategoryStore.shared.getCategories())
        self.view.updateList(section)
        self.view.selectListItemCell()
        self.view.setMessageInputViewTitle("Message:")
        self.view.setSendButtonAction { [weak self] in
            guard let request = self?.view.getRequestModel() else {
                return
            }
            self?.viewModel.sendRequest(request)
        }
    }
    
}

extension RequestSendingPresenter: Presentable {
    
    func handleViewState(_ state: Any) {
        
    }
    
}
