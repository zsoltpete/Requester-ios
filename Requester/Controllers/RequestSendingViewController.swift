//
//  RequestSendingViewController.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 07..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

class RequestSendingViewController: BaseViewController {
    
    //IBOutlets
    @IBOutlet var masterView: RequestSendingMView!
    
    //Variables
    var presenter: RequestSendingPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let service = RequestSendingService()
        let viewModel = RequestSendingViewModel(service: service)
        presenter = RequestSendingPresenter(view: masterView, viewModel: viewModel)
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
    
}

extension RequestSendingViewController: RouteIdentifiable {
    static var storyboardName: BaseViewController.StoryboardIdentifier {
        return .main
    }
    
}
