//
//  MemberListMViewContract.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 29..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

protocol MemberListMViewContract: BaseTableViewContract {
    
    ///Update tableview with models
    func updateList(_ model: [MoralledItemCellBindable])
    
    ///Did selection of tableview cell
    func setDidSelectionAction(_ action: MoralledItemActionCompletition?)
    
}
