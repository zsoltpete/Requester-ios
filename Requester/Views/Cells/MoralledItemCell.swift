//
//  MoralledItemCell.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 29..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import CYExtensions
import PixelPerfectSwift
import UIKit

class MoralledItemCell: UITableViewCell {
    
    // MARK: - IBOutlets Constraint
    @IBOutlet weak var borderedImageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var borderedImageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var borderedImageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var nameLabelLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var nameLabelTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var moralPercentLabelTrailingConstraint: NSLayoutConstraint!
    
    // MARK: - IBOutlets
    @IBOutlet weak var borderedImageView: BorderedImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moralPercentLabel: UILabel!
    @IBOutlet weak var seperatorView: UIView!
    
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
        self.addFonts()
        self.addColors()
    }
    
    func bind(_ model: MoralledItemCellBindable) {
        self.borderedImageView.loadImageUrl(model.pImageSrc)
        self.nameLabel.text = model.pName
        self.moralPercentLabel.text = model.pMoralPercent.toPercentedString()
        self.colorizeMoralPercent(model.pMoralPercent)
    }
    
    private func colorizeMoralPercent(_ percent: Int) {
        if percent < 50 {
            self.moralPercentLabel.theme.textColor = themed {
                $0.lowPercentColor
            }
        } else {
            self.moralPercentLabel.theme.textColor = themed {
                $0.highPercentColor
            }
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }

}

extension MoralledItemCell: ComponentsScaling {
    
    func setScalableComponents() {
        self.borderedImageViewLeadingConstraint.constant = 16.0.pps
        self.borderedImageViewTopConstraint.constant = 8.0.pps
        self.borderedImageViewBottomConstraint.constant = 8.0.pps
        self.nameLabelLeadingConstraint.constant = 22.0.pps
        self.nameLabelTrailingConstraint.constant = 8.0.pps
        self.moralPercentLabelTrailingConstraint.constant = 18.0.pps
    }
    
}

extension MoralledItemCell: ComponentDesigning {
    
    func addFonts() {
        
    }
    
    func addColors() {
        self.nameLabel.theme.textColor = themed {
            $0.primaryTextColor
        }
        self.seperatorView.theme.backgroundColor = themed {
            $0.dividerGray
        }
    }
    
}
