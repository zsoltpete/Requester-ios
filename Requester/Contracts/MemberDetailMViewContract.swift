//
//  MemberDetailMViewContract.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 30..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

protocol MemberDetailMViewContract {
    
    ///Set Profile image view with url string
    func setProfileImageView(_ urlString: String)
    
    ///Set user's team name
    func setTeamName(_ name: String)
    
    ///Update List items and section header
    func updateMoralList(_ sectionTitle: String, dataSource: [MoralledItemCellBindable])
    
    //Bind Send button
    func bindRequestButton(_ title: String)
    
    ///Set action for button
    func setRequestButtonAction(_ action: DefaultCompletion?)
    
}
