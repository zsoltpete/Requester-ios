//
//  RequestSendingMView.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 07..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import CYExtensions
import UIKit

class RequestSendingMView: UIView {
    
    //@IBOutlets Constraints
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageInputViewHeightConstraint: NSLayoutConstraint!
    
    //@IBOutlets
    @IBOutlet weak var sendButton: RButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageInputView: RInputView!
    
    //Var
    var dataSource = SelectableListDataSource(SelectableListItemSection())
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initTableView()
        self.registerCells()
        self.setScalableComponents()
    }
    
    //swiftlint:disable weak_self_closure
    ///Modify datasource to deselect all items
    fileprivate func deselectAll() {
        guard let array = self.dataSource.model.items as? [Category] else {
            return
        }
        array.forEach { item in
            item.selected = false
        }
        self.dataSource.model.items = array
    }
    
    fileprivate func selectItem(_ title: String) {
        guard let array = self.dataSource.model.items as? [Category] else {
            return
        }
        
        array.filter { category -> Bool in
            category.pTitle == title
            }.forEach { category in
                category.selected = true
        }
        self.dataSource.model.items = array
    }
    
}

extension RequestSendingMView: ComponentsScaling {
    
    func setScalableComponents() {
        self.tableViewHeightConstraint.constant = 227.0.pps
        self.messageInputViewHeightConstraint.constant = 134.0.pps
    }
    
}

extension RequestSendingMView: RequestSendingContract {
    
    func getRequestModel() -> RequestSendingRequest? {
        let message = self.messageInputView.getText()
        guard let category = self.dataSource.getSelectedItem() as? Category else {
            Log.warning("Not selected item")
            return nil
        }
        let model = RequestSendingRequest(message: message, categoryId: category.id)
        
        return model
    }
    
    func setSendButtonAction(_ action: DefaultCompletion?) {
        self.sendButton.setButtonAction(action)
    }
    
    func setMessageInputViewTitle(_ title: String) {
        self.messageInputView.setHeaderTitle(title)
    }
    
    //swiftlint:disable weak_self_closure
    func selectListItemCell() {
        self.dataSource.setSelectionAction { item in
            Log.info(item)
            self.deselectAll()
            self.selectItem(item.pTitle)
            self.updateList(self.dataSource.model)
        }
    }
    
    func initTableView() {
        self.tableView.theme.backgroundColor = themed {
            $0.backgroundColor
        }
        self.tableView.rowHeight = 60.0.pps
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.dataSource
    }
    
    func registerCells() {
        let cellNib = UINib(nibName: Cells.SelectableListItemCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: Cells.SelectableListItemCell)
    }
    
    func updateList(_ model: SelectableListItemSection) {
        self.dataSource.model = model
        self.tableView.reloadData()
    }
    
}
