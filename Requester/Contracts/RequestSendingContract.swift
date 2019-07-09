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
    
    ///Set message input title
    func setMessageInputViewTitle(_ title: String)
    
    ///Set action for button
    func setSendButtonAction(_ action: DefaultCompletion?)
    
    ///Create request sending model if present
    func getRequestModel() -> RequestSendingRequest?
    
}
