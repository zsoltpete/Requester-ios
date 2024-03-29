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
    private var selectionAction: MoralledItemActionCompletition?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initTableView()
    }
    
}

extension MemberListMView: MemberListMViewContract {
    
    func updateList(_ model: [MoralledItemCellBindable]) {
        tableViewDisposable?.dispose()
        self.tableViewDisposable = Observable.just(model).bind(to: self.tableView.rx.items(cellIdentifier: Cells.MoralledItemCell)) { (_, model, cell: MoralledItemCell) in
            cell.bind(model)
        }
    }
    
    func registerCells() {
        let cellNib = UINib(nibName: Cells.MoralledItemCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: Cells.MoralledItemCell)
    }
    
    func setDidSelectionAction(_ action: MoralledItemActionCompletition?) {
        self.selectionAction = action
    }
    
    func initTableView() {
        self.tableView.rowHeight = 60.0
        self.tableView.applyFakeHeader()
        self.registerCells()
        self.tableView.delegate = nil
        self.tableView.dataSource = nil
        self.tableView.rx.modelSelected(MoralledItemCellBindable.self).subscribe(onNext: { [weak self]model in
            self?.selectionAction?(model)
        }).disposed(by: disposeBag)
    }
    
}
