//
//  MemberListMView.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 29..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class MemberListMView: UIView {
    
    var tableViewDisposable: Disposable?
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initTableView()
    }
    
    private func initTableView() {
        self.tableView.rowHeight = 60.0
        self.tableView.applyFakeHeader()
        self.registerCells()
        self.tableView.delegate = nil
        self.tableView.dataSource = nil
    }
    
}

extension MemberListMView: MemberListMViewContract {
    
    func updateList(_ model: [MemberListItemCellBindable]) {
        tableViewDisposable?.dispose()
        self.tableViewDisposable = Observable.just(model).bind(to: self.tableView.rx.items(cellIdentifier: Cells.MemberListItemCell)) { (_, model, cell: MemberListItemCell) in
            cell.bind(model)
        }
    }
    
    func registerCells() {
        let cellNib = UINib(nibName: Cells.MemberListItemCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: Cells.MemberListItemCell)
    }
    
}
