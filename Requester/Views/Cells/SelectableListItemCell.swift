//
//  SelectableListItemCell.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 07..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import CYExtensions
import RxCocoa
import RxSwift
import UIKit

class SelectableListItemCell: UITableViewCell {
    
    // MARK: - IBOutlets Constraint
    @IBOutlet weak var titleLabelLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabelTrailingConstraint: NSLayoutConstraint!
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - let variables
    fileprivate let disposeBag = DisposeBag()
    // MARK: - var variables
    fileprivate var selection = BehaviorRelay<Bool>(value: false)
    // MARK: - LifeCycle methods
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialize()
    }
    
    private func initialize() {
        self.setScalableComponents()
        self.titleLabel.addSelectableListItemModifier()
        self.initSelectionObserver()
    }
    
    private func initSelectionObserver() {
        self.selection.subscribe(onNext: { [weak self]selected in
            if selected {
                self?.titleLabel.backgroundColor = Colors.HighPercentColor.light
            } else {
                self?.titleLabel.backgroundColor = .clear
            }
        }).disposed(by: disposeBag)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
}

extension SelectableListItemCell: ComponentsScaling {
    
    func setScalableComponents() {
        self.titleLabelLeadingConstraint.constant = 1.0.pps
        self.titleLabelTrailingConstraint.constant = self.titleLabelLeadingConstraint.constant
    }
    
}

extension SelectableListItemCell: SelectableListItemCellContract {
    
    func select(_ select: Bool) {
        self.selection.accept(select)
    }
    
    func bind(_ model: SelectableListItem) {
        self.titleLabel.text = model.pTitle
        self.selection.accept(model.pSelected)
    }
    
    func toggle() {
        var newValue = self.selection.value
        newValue.toggle()
        self.selection.accept(newValue)
    }
    
}
