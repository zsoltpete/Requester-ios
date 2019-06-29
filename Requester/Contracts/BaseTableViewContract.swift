//
//  BaseTableViewContract.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 29..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

protocol BaseTableViewContract {
    
    associatedtype DataSourceItem: Any
    
    ///Update tableview with models
    func updateList(_ model: [DataSourceItem])
    
    ///Register cells to tableview
    func registerCoctailCell()
}
