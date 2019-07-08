//
//  BorderedImageView.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 29..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import CYExtensions
import Foundation
import UIKit

class BorderedImageView: UIView {

    // MARK: - IBOutlets Constraint
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    
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
        let nib = UINib(nibName: "BorderedImageView", bundle: bundle)
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
        self.imageView.layer.masksToBounds = true
        self.imageView.layer.borderWidth = 2.0.pps
        self.imageView.layer.cornerRadius = self.imageView.frame.size.height / 2.0
        self.imageView.layer.theme.borderColor = themed { $0.borderColor.cgColor
        }
    }
    
    func initialize() {
        self.loadXib()
        self.imageView.contentMode = .center
        self.setScalableComponents()
        self.addFonts()
        self.addColors()
    }
    
    func loadImageUrl(_ urlString: String) {
        if urlString.starts(with: "icon_") {
            self.imageView.image = UIImage(named: urlString)
        } else {
            self.imageView.downloaded(from: urlString)
        }
        
    }

}

extension BorderedImageView: ComponentsScaling {
    
    func setScalableComponents() {
        
    }
    
}

extension BorderedImageView: ComponentDesigning {
    
    func addFonts() {
        
    }
    
    func addColors() {
        
    }
    
}
