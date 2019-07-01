//
//  MemberDetailMView.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 30..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import CYExtensions
import UIKit

class MemberDetailMView: UIView {
    
    //@IBOutlets Constraints
    @IBOutlet weak var sendButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var profileImageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var teamLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var teamLabelBottomConstraint: NSLayoutConstraint!
    
    //@IBOutlets
    @IBOutlet weak var profileImageView: BorderedImageView!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var moralListView: MoralListView!
    @IBOutlet weak var requestButton: RButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setScalableComponents()
    }
    
}

extension MemberDetailMView: ComponentsScaling {
    
    func setScalableComponents() {
        self.profileImageViewTopConstraint.constant = 0.0.pps
        self.teamLabelTopConstraint.constant = 25.0.pps
        self.teamLabelBottomConstraint.constant = -25.0.pps
        self.sendButtonHeightConstraint.constant = 60.0.pps
    }
    
}

extension MemberDetailMView: MemberDetailMViewContract {
    
    func bindRequestButton(_ title: String) {
        self.requestButton.setButtonTitle(title)
    }
    
    func setProfileImageView(_ urlString: String) {
        self.profileImageView.loadImageUrl(urlString)
    }
    
    func setTeamName(_ name: String) {
        self.teamLabel.text = name
    }
    
    func updateMoralList(_ sectionTitle: String, dataSource: [MoralledItemCellBindable]) {
        self.moralListView.setSectionHeaderTitle(sectionTitle)
        self.moralListView.updateList(dataSource)
    }
    
}
