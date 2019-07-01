//
//  MemberDetailMView.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 30..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

class MemberDetailMView: UIView {
    
    //@IBOutlets Constraints
    @IBOutlet weak var profileImageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var teamLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var teamLabelBottomConstraint: NSLayoutConstraint!
    
    //@IBOutlets
    @IBOutlet weak var profileImageView: BorderedImageView!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var moralListView: MoralListView!
    @IBOutlet weak var requestButton: RButton!
    
}

extension MemberDetailMView: MemberDetailMViewContract {
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
