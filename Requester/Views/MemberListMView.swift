//
//  MemberListMView.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 29..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

class MemberListMView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    
}

extension MemberListMView: MemberListMViewContract {
    
    func updateList(_ model: [Any]) {
        
    }
    
    func registerCoctailCell() {
        
    }
    
}
