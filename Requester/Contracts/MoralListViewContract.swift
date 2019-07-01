//
//  MoralListViewContract.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 30..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

protocol MoralListViewContract: BaseTableViewContract {
    
    ///Set list section header title
    func setSectionHeaderTitle(_ title: String)
    
    ///Update tableview with models
    func updateList(_ model: [MoralledItemCellBindable])
    
}
