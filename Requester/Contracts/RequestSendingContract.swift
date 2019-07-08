//
//  RequestSendingContract.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 07..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

protocol RequestSendingContract: BaseTableViewContract {
    
    ///Updale selectable list
    func updateList(_ model: SelectableListItemSection)
    
    ///Select list item cell
    func selectListItemCell()
    
}
