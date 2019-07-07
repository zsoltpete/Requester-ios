//
//  RPopUpMultiFooterView.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 07..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import CYExtensions
import Foundation
import UIKit

class RPopUpMultiFooterView: UIView {

    // MARK: - IBOutlets Constraint
    @IBOutlet weak var agreeButtonTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var disagreeButtonLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var neverButtonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var neverButtonBottomConstraint: NSLayoutConstraint!
    
    // MARK: - IBOutlets
    @IBOutlet weak var agreeButton: UIButton!
    @IBOutlet weak var neverButton: UIButton!
    @IBOutlet weak var disagreeButton: UIButton!
    
    // MARK: - let variables
    
    // MARK: - var variables
    var contentView: UIView?
    var agreeButtonAction: DefaultCompletion?
    var disagreeButtonAction: DefaultCompletion?
    var neverButtonAction: DefaultCompletion?
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
        let nib = UINib(nibName: "RPopUpMultiFooterView", bundle: bundle)
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
        self.initButtons()
    }
    
    
    private func initButtons() {
        self.agreeButton.addPopUpAgreeButtonModifier()
        self.neverButton.addPopUpNeverButtonModifier()
        self.disagreeButton.addPopUpButtonModifier()
        
        self.agreeButton.addTarget(self, action: #selector(agreeButtonActioWrapper), for: .touchUpInside)
        self.neverButton.addTarget(self, action: #selector(neverButtonActioWrapper), for: .touchUpInside)
        self.disagreeButton.addTarget(self, action: #selector(disagreeButtonActioWrapper), for: .touchUpInside)
    }
    
    @objc
    private func agreeButtonActioWrapper() {
        self.agreeButtonAction?()
    }
    
    @objc
    private func neverButtonActioWrapper() {
        self.neverButtonAction?()
    }
    
    @objc
    private func disagreeButtonActioWrapper() {
        self.disagreeButtonAction?()
    }

}

extension RPopUpMultiFooterView: ComponentsScaling {
    
    func setScalableComponents() {
        self.disagreeButtonLeadingConstraint.constant = 20.0.pps
        self.agreeButtonTrailingConstraint.constant = self.disagreeButtonLeadingConstraint.constant
        self.neverButtonBottomConstraint.constant = 18.0.pps
        self.neverButtonTopConstraint.constant = 4.0.pps
        
    }
    
}

extension RPopUpMultiFooterView: RPopUpMultiFooterViewConstract {
    
    func setAgreeButtonTitle(_ title: String) {
        self.agreeButton.setTitle(title, for: .normal)
    }
    
    func setAgreeButtonAction(_ action: DefaultCompletion?) {
        self.agreeButtonAction = action
    }
    
    func setNeverButtonTitle(_ title: String) {
        self.neverButton.setTitle(title, for: .normal)
    }
    
    func setNeverButtonAction(_ action: DefaultCompletion?) {
        self.neverButtonAction = action
    }
    
    func setDisagreeButtonTitle(_ title: String) {
        self.disagreeButton.setTitle(title, for: .normal)
    }
    
    func setDisagreeButtonAction(_ action: DefaultCompletion?) {
        self.disagreeButtonAction = action
    }
}
