//
//  SelectableListItemCellContract.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 07..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

protocol SelectableListItemCellContract {
    
    ///Bind model for its cell
    func bind(_ model: SelectableListItem)
    
    //Select cell for hishlighting
    func select(_ select: Bool)
    
    //Toggle selection
    func toggle()
    
}
