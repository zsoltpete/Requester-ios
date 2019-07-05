//
//  RPopUpViewDataSource.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 05..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

class RPopUpViewDataSource: NSObject {
    
    var model: RPopUpViewBindable
    
    init(model: RPopUpViewBindable) {
        self.model = model
    }
    
}

extension RPopUpViewDataSource:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.pMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.RPopUpCell, for: indexPath) as? RPopUpCell else {
            return UITableViewCell()
        }
        
        cell.bind(model.pMessages[indexPath.row])
        
        return cell
    }
    
}

extension RPopUpViewDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45.0.pps
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.RPopUpHeaderCell) as? RPopUpHeaderCell else {
            return UITableViewCell()
        }
        
        cell.setTitle(self.model.pTitle)
        
        return cell
    }
    
}
