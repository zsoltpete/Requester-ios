//
//  MemberListService.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 29..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import CYExtensions
import FirebaseDatabase
import Foundation
import RxCocoa
import RxSwift

class MemberListService: DataServiceProvider {
    
    var ref: DatabaseReference
    
    override init() {
        ref = Database.database().reference()
        super.init()
    }
    
    func fetchAllUser() -> Single<[User]> {
        return Single<[User]>.create { [weak self]single in
            self?.ref.child("users").observeSingleEvent(of: .value, with: { snapshot in
                var users = [User]()
                guard let dictValue = snapshot.value as? NSDictionary else {
                    return
                }
                for (_, value) in dictValue {
                    guard let dict = value as? [String: Any] else {
                        return
                    }
                    guard let user = User(JSON: dict) else {
                        return
                    }
                    users.append(user)
                }
                single(.success(users))
            }) { error in
                Log.error(error.localizedDescription)
                single(.error(error))
            }
            return Disposables.create()
        }
        
    }
    
}
