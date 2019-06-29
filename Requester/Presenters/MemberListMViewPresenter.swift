//
//  MemberListMViewPresenter.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 29..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

class MemberListMViewPresenter: BasePresenter {
    
    init(view: MemberListMViewContract, viewModel: ) {
        self.viewModel = viewModel
        self.view = view
        super.init()
        self.addRandomButtonAction()
        self.initSubscriptions()
    }
    
}
