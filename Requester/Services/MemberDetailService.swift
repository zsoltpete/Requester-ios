//
//  MemeberDetailService.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 30..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class MemberDetailService: FirDataServiceProvider {
    
    func fetchUser(id: String) -> Single<User> {
        return self.fetchBaseUser(id: id).flatMap() { [weak self](user: User) in
            guard let guardSelf = self, let moralId = user.moralId else {
                return Single<User>.create { _ in
                    Disposables.create()
                }
            }
            return guardSelf.fetchUsersMoral(id: moralId).flatMap() { (moral: MoralItem) in
                Single<User>.create { single in
                    let helper = MoralListItemHelper()
                    let listItems = helper.createMoralList(CategoryStore.shared.getCategories(), moralItem: moral)
                    let endUser = user
                    endUser.moralList = listItems
                    single(.success(user))
                    
                    return Disposables.create()
                }
            }
        }
    }
    
    ///Fetch User base
    private func fetchBaseUser(id: String) -> Single<User> {
        let endPoint = "users/" + id
        return self.firRequest(endPoint: endPoint)
    }
    
    ///Fetch user's moral
    private func fetchUsersMoral(id: String) -> Single<MoralItem> {
        let endPoint = "morals/" + id
        return self.firRequest(endPoint: endPoint)
    }
    
}
