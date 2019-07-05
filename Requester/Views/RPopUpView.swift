//
//  RPopUpView.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 05..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import CYExtensions
import Foundation
import RxCocoa
import RxGesture
import RxSwift
import UIKit

class RPopUpView: UIView {

    // MARK: - IBOutlets Constraint
    @IBOutlet weak var tableViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableViewLeadingConstraint: NSLayoutConstraint!
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundView: UIView!
    
    // MARK: - let variables
    private let disposeBag = DisposeBag()
    // MARK: - var variables
    var contentView: UIView?
    var dataSource: RPopUpViewDataSource?
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
        let nib = UINib(nibName: "RPopUpView", bundle: bundle)
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
        self.setScalableComponents()
        self.registerCells()
        self.initTableView()
        self.addGestureRecognizer()
    }
    
    private func addGestureRecognizer() {
        self.backgroundView.rx.tapGesture().when(.recognized).subscribe(onNext: { [weak self]_ in
            self?.animateOut()
        }).disposed(by: disposeBag)
    }

}

extension RPopUpView: ComponentsScaling {
    
    func setScalableComponents() {
        self.tableViewLeadingConstraint.constant = 30.0.pps
        self.tableViewTrailingConstraint.constant = self.tableViewLeadingConstraint.constant
    }
    
}

extension RPopUpView: RPopUpViewContract {
    
    func registerCells() {
        let cellNib = UINib(nibName: Cells.RPopUpHeaderCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: Cells.RPopUpHeaderCell)
        let cellNib2 = UINib(nibName: Cells.RPopUpCell, bundle: nil)
        tableView.register(cellNib2, forCellReuseIdentifier: Cells.RPopUpCell)
    }
    
    func initTableView() {
        self.tableView.isScrollEnabled = false
        self.tableView.rowHeight = 50.0.pps
        self.backgroundView.theme.backgroundColor = themed {
           $0.rPopUpBackground
        }
        self.tableView.theme.backgroundColor = themed {
            $0.backgroundColor
        }
        self.tableView.layer.theme.borderColor = themed { $0.borderColor.cgColor
        }
        self.backgroundView.alpha = 0.0
        self.tableView.alpha = 0.0
        self.tableView.layer.cornerRadius = 9.0.pps
    }
    
    func bind(_ model: RPopUpViewBindable) {
        self.dataSource = RPopUpViewDataSource(model: model)
        guard let dataSource = self.dataSource else {
            return
        }
        self.tableView.dataSource = dataSource
        self.tableView.delegate = dataSource
        self.tableView.reloadData()
    }
    
    func animateIn() {
        UIView.animate(withDuration: 0.4) { [weak self]  in
            self?.backgroundView.alpha = 0.79
            self?.tableView.alpha = 1.0
        }
    }
    
    func animateOut() {
        self.fadeOut { [weak self]_ in
            self?.removeFromSuperview()
        }
    }
    
}
