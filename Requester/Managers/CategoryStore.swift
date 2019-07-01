//
//  CategoryStore.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 01..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class CategoryStore {
    
    private let disposeBag = DisposeBag()
    static let shared = CategoryStore()
    let service: CategoryService
    private var categories = BehaviorRelay<[Category]>(value: [])
    
    private init() {
        self.service = CategoryService()
    }
    
    func fetchCategories() {
        self.service.fetchCategories().subscribe(onSuccess: { [weak self]categories in
            self?.categories.accept(categories)
        }).disposed(by: disposeBag)
    }
    
    func getCategories() -> [Category] {
        return self.categories.value
    }
    
}
