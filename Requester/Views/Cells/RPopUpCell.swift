//
//  RPopUpCell.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 05..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import CYExtensions
import UIKit

class RPopUpCell: UITableViewCell {
    
    // MARK: - IBOutlets Constraint
    @IBOutlet weak var messageLabelLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageLabelTrailingConstraint: NSLayoutConstraint!
    
    // MARK: - IBOutlets
    @IBOutlet weak var messageLabel: UILabel!
    
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
        self.messageLabel.addPopUpMessageModifier()
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }

}

extension RPopUpCell: ComponentsScaling {
    
    func setScalableComponents() {
        self.messageLabelLeadingConstraint.constant = 16.0.pps
        self.messageLabelTrailingConstraint.constant = self.messageLabelLeadingConstraint.constant
    }
    
}

extension RPopUpCell: RPopUpCellConstract {
    
    func bind(_ model: RPopUpCellBindable) {
        self.messageLabel.text = model.pText
    }
    
}
