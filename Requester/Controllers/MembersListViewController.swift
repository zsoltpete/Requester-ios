//
//  MembersListViewController.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 29..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

class MembersListViewController: BaseViewController {
    
    @IBOutlet var masterView: MemberListMView!
    
    var presenter: MemberListMViewPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let service = MemberListService()
        let viewModel = MemberListViewModel(service: service)
        presenter = MemberListMViewPresenter(view: self.masterView, viewModel: viewModel)
        presenter?.presenterDidLoad()
        self.setControllerTitle("Members")
        self.initNotifications()
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
    
    func setControllerTitle(_ title: String) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.title = title
    }
    
    func initNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(showMemberDetailView), name: Events.ShowMemberDetailView, object: nil)
    }
    
    @objc
    private func showMemberDetailView(_ notification: Notification) {
        guard let userId = notification.object as? String else {
            return
        }
        
        self.show(classType: MemberDetailViewController.self) { (controller: MemberDetailViewController) in
            controller.setUserId(userId)
        }
    }
}

extension MembersListViewController: RouteIdentifiable {
    static var storyboardName: BaseViewController.StoryboardIdentifier {
        return .main
    }
    
}
