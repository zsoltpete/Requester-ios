//
//  RButton.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 30..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import CYExtensions
import Foundation
import UIKit

class RButton: UIView {

    // MARK: - IBOutlets Constraint
    @IBOutlet weak var buttonTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonLeadingConstraint: NSLayoutConstraint!
    
    // MARK: - IBOutlets
    @IBOutlet weak var button: UIButton!
    
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
        let nib = UINib(nibName: "RButton", bundle: bundle)
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
        self.button.addRButtonModifier()
        self.button.addTarget(self, action: #selector(buttonActionWrapper), for: .touchUpInside)
    }
    
    @objc
    private func buttonActionWrapper() {
        buttonAction?()
    }

}

extension RButton: ComponentsScaling {
    
    func setScalableComponents() {
        self.buttonLeadingConstraint.constant = 30.0.pps
        self.buttonTrailingConstraint.constant = self.buttonLeadingConstraint.constant
    }
    
}

extension RButton: RButtonContract {
    
    func setButtonAction(_ action: DefaultCompletion?) {
        self.buttonAction = action
    }
    
    func setButtonTitle(_ title: String) {
        self.button.setTitle(title, for: .normal)
    }
    
}
