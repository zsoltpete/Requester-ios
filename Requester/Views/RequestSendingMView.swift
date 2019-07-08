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
    
    //@IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //Var
    var dataSource = SelectableListDataSource(SelectableListItemSection())
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initTableView()
        self.registerCells()
        self.setScalableComponents()
    }
    
}

extension RequestSendingMView: ComponentsScaling {
    
    func setScalableComponents() {
        self.tableViewHeightConstraint.constant = 200.0.pps
    }
    
}

extension RequestSendingMView: RequestSendingContract {
    
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
