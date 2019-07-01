//
//  MemberDetailViewController.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 30..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

class MemberDetailViewController: BaseViewController {
    
    @IBOutlet var masterView: MemberDetailMView!
    var presenter: MemberDetailViewPresenter?
    
    private var userId: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let service = MemberDetailService()
        let viewModel = MemberDetailViewModel(service: service)
        presenter = MemberDetailViewPresenter(view: masterView, viewModel: viewModel, userId: self.userId)
        presenter?.presenterDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.presenterWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.presenterDidAppeared()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.presenterWillDisappear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter?.presenterDidDisappear()
    }
    
    func setUserId(_ userId: String) {
        self.userId = userId
    }
    
}

extension MemberDetailViewController: RouteIdentifiable {
    static var storyboardName: BaseViewController.StoryboardIdentifier {
        return .main
    }
    
}
