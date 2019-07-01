//
//  MoralListItemHelper.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 01..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

class MoralListItemHelper {
    
    ///Create from categories and moral item a list of bindable moralitems
    func createMoralList(_ categories: [Category], moralItem: MoralItem) -> [MoralListItem] {
        var array = [MoralListItem]()
        for category in categories {
            let listItem = self.createListItem(category: category, moralItem: moralItem)
            array.append(listItem)
        }
        return array
    }
    
    //Create Bindable list item from category and moralitem
    private func createListItem(category: Category, moralItem: MoralItem) -> MoralListItem {
        
        if category.id == CategoryIds.Help {
            return MoralListItem(category: category, value: moralItem.help)
        } else if category.id == CategoryIds.CodeReview {
            return MoralListItem(category: category, value: moralItem.codeReview)
        } else {
            return MoralListItem(category: category, value: moralItem.meetings)
        }
        
    }
    
}
