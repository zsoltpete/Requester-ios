//
//  RInputView.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 08..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import CYExtensions
import Foundation
import UIKit

class RInputView: UIView {

    // MARK: - IBOutlets Constraint
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var inputViewBorderViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var inputViewBorderViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var headerViewBottomConstraint: NSLayoutConstraint!
    
    // MARK: - IBOutlets
    @IBOutlet weak var headerView: SectionHeaderView!
    @IBOutlet weak var inputViewBorderView: UIView!
    @IBOutlet weak var inputTextView: UITextView!
    
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
        let nib = UINib(nibName: "RInputView", bundle: bundle)
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
        self.inputViewBorderView.addInputViewBorderModifiers()
        self.initInputView()
    }
    
    private func initInputView() {
        self.inputTextView.text = ""
        self.inputTextView.addModifier()
    }

}

extension RInputView: ComponentsScaling {
    
    func setScalableComponents() {
        self.inputViewBorderViewLeadingConstraint.constant = 16.0.pps
        self.inputViewBorderViewTrailingConstraint.constant = self.inputViewBorderViewLeadingConstraint.constant
        self.headerViewBottomConstraint.constant = -8.0.pps
    }
    
}

extension RInputView: RInputViewContract {
    
    func setHeaderTitle(_ title: String) {
        self.headerView.setTitle(title)
    }
    
}
