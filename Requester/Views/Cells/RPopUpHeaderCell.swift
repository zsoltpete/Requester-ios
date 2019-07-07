//
//  RPopUpHeaderCell.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 05..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import CYExtensions
import UIKit

class RPopUpHeaderCell: UITableViewCell {
    
    // MARK: - IBOutlets Constraint
    @IBOutlet weak var titleLabelLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabelTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabelTopConstraint: NSLayoutConstraint!
    
    // MARK: - IBOutlets
    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    // MARK: - let variables
    
    // MARK: - var variables
    
    // MARK: - LifeCycle methods
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialize()
    }
    
    func initialize() {
        self.setScalableComponents()
        self.titleLabel.addPopUpHeaderModifier()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
}

extension RPopUpHeaderCell: ComponentsScaling {
    
    func setScalableComponents() {
        self.titleLabelTopConstraint.constant = 7.0.pps
        self.titleLabelLeadingConstraint.constant = 20.0.pps
        self.titleLabelTrailingConstraint.constant = self.titleLabelLeadingConstraint.constant
    }
    
}

extension RPopUpHeaderCell: RPopUpHeaderCellContract {
    
    func setTitle(_ title: String) {
        self.titleLabel.text = title
    }
    
}
