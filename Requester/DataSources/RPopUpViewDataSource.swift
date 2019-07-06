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
    private var agreeCompletition: DefaultCompletion?
    private var disagreeCompletition: DefaultCompletion?
    private var neverCompletition: DefaultCompletion?
    
    init(model: RPopUpViewBindable, agreeCompletition: DefaultCompletion? = nil, disagreeCompletition: DefaultCompletion? = nil, neverCompletition: DefaultCompletion? = nil) {
        self.model = model
        self.agreeCompletition = agreeCompletition
        self.disagreeCompletition = disagreeCompletition
        self.neverCompletition = neverCompletition
    }
    
}

extension RPopUpViewDataSource: UITableViewDataSource {
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
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 64.0.pps
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 64.0.pps)
        let footer = RPopUpSimpleFooterView(frame: frame)
        
        footer.setButtonTitle(self.model.pButtons[section])
        footer.setButtonAction(self.agreeCompletition)
        
        return footer
    }
    
}
