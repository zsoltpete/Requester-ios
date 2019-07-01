//
//  MoralListView.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 30..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import UIKit

class MoralListView: UIView {

    // MARK: - IBOutlets Constraint
    
    // MARK: - IBOutlets
    @IBOutlet weak var sectionHeaderView: SectionHeaderView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - let variables
    
    // MARK: - var variables
    var contentView: UIView?
    var dataSource: MoralListDataSource = MoralListDataSource()
    // MARK: - LifeCycle methods

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialize()
    }

    func loadXib() {
        guard contentView == nil else {
            return
        }
        guard let view = loadViewFromNib() else {
            return

        }
        view.frame = bounds
        view.autoresizingMask =
            [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
    }

    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "MoralListView", bundle: bundle)
        return nib.instantiate(
            withOwner: self,
            options: nil).first as? UIView
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.loadXib()
        contentView?.prepareForInterfaceBuilder()
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    func initialize() {
        self.loadXib()
    }

}

extension MoralListView: MoralListViewContract {
    
    func setSectionHeaderTitle(_ title: String) {
        self.sectionHeaderView.setTitle(title)
    }
    
    func updateList(_ model: [MoralledItemCellBindable]) {
        self.dataSource.setDataSource(model)
    }
    
    func registerCells() {
        let cellNib = UINib(nibName: Cells.MoralledItemCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: Cells.MoralledItemCell)
    }
    
}
