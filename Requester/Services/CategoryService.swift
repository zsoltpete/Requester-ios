//
//  CategoryService.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 01..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class CategoryService: FirDataServiceProvider {
    
    ///Fetch all category
    func fetchCategories() -> Single<[Category]> {
        let endPoint = "categories/"
        return self.firRequest(endPoint: endPoint)
    }
    
}
