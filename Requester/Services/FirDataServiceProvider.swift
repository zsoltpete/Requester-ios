//
//  FirDataServiceProvider.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 29..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import CYExtensions
import FirebaseDatabase
import Foundation
import ObjectMapper
import RxCocoa
import RxSwift
import SwiftyJSON

class FirDataServiceProvider: DataServiceProvider {
    
    var ref: DatabaseReference
    
    override init() {
        ref = Database.database().reference()
        super.init()
    }
    
    func firRequest<ReturnValue: Mappable>(endPoint: String) -> Single<[ReturnValue]> {
        return Single<[ReturnValue]>.create { [weak self]single in
            self?.ref.child(endPoint).observeSingleEvent(of: .value, with: { snapshot in
                var array = [ReturnValue]()
                guard let dictValue = snapshot.value as? NSDictionary else {
                    return
                }
                
                Log.info(dictValue)
                
                for (_, value) in dictValue {
                    guard let dict = value as? [String: Any] else {
                        return
                    }
                    guard let obj = ReturnValue(JSON: dict) else {
                        return
                    }
                    array.append(obj)
                }
                single(.success(array))
            }) { error in
                Log.error(error.localizedDescription)
                single(.error(error))
            }
            return Disposables.create()
        }
        
    }
    
    func firRequest<ReturnValue: Mappable>(endPoint: String) -> Single<ReturnValue> {
        return Single<ReturnValue>.create { [weak self]single in
            self?.ref.child(endPoint).observeSingleEvent(of: .value, with: { snapshot in
                guard let dictValue = snapshot.value as? NSDictionary else {
                    return
                }
                
                Log.info(dictValue)
                
                guard let dict = dictValue as? [String: Any] else {
                    return
                }
                guard let obj = ReturnValue(JSON: dict) else {
                    return
                }
                single(.success(obj))
            }) { error in
                Log.error(error.localizedDescription)
                single(.error(error))
            }
            return Disposables.create()
        }
        
    }
    
}
