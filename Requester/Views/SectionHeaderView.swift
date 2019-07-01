//
//  SectionHeaderView.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 30..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import CYExtensions
import Foundation
import UIKit

class SectionHeaderView: UIView {

    // MARK: - IBOutlets Constraint
    @IBOutlet weak var labelLeadingContraint: NSLayoutConstraint!
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - let variables
    
    // MARK: - var variables
    var contentView: UIView?
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
        let nib = UINib(nibName: "SectionHeaderView", bundle: bundle)
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
        self.titleLabel.addSectionHeaderModifier()
    }

}

extension SectionHeaderView: ComponentsScaling {
    
    func setScalableComponents() {
        self.labelLeadingContraint.constant = 16.0.pps
    }
    
}

extension SectionHeaderView: SectionHeaderViewContract {
    
    func setTitle(_ title: String) {
        self.titleLabel.text = title
    }
    
}
