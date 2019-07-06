//
//  RPopUpSimpleFooterView.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 06..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import CYExtensions
import Foundation
import UIKit

class RPopUpSimpleFooterView: UIView {

    // MARK: - IBOutlets Constraint
    @IBOutlet weak var okButtonTrailingConstraint: NSLayoutConstraint!
    
    // MARK: - IBOutlets
    @IBOutlet weak var okButton: UIButton!
    
    // MARK: - let variables
    
    // MARK: - var variables
    var contentView: UIView?
    var buttonAction: DefaultCompletion?
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
        let nib = UINib(nibName: "RPopUpSimpleFooterView", bundle: bundle)
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
        self.okButton.addPopUpButtonModifier()
        self.okButton.addTarget(self, action: #selector(buttonActioWrapper), for: .touchUpInside)
    }
    
    @objc
    private func buttonActioWrapper() {
        self.buttonAction?()
    }

}

extension RPopUpSimpleFooterView: ComponentsScaling {
    
    func setScalableComponents() {
        self.okButtonTrailingConstraint.constant = 18.0.pps
    }
    
}

extension RPopUpSimpleFooterView: RPopUpSimpleFooterViewContract {
    
    func setButtonTitle(_ title: String) {
        self.okButton.setTitle(title, for: .normal)
    }
    
    func setButtonAction(_ action: DefaultCompletion?) {
        self.buttonAction = action
    }
    
}
