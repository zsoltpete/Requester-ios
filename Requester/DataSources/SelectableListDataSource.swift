//
//  SelectableListDataSource.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 07..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

class SelectableListDataSource: NSObject {
    
    var model: SelectableListItemSection
    var selectionAction: SelectableListItemCompletion?
    
    init(_ model: SelectableListItemSection) {
        self.model = model
    }
    
    func setSelectionAction(_ action: SelectableListItemCompletion?) {
        self.selectionAction = action
    }
    
}

extension SelectableListDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.SelectableListItemCell, for: indexPath) as? SelectableListItemCell else {
            return UITableViewCell()
        }
        
        cell.bind(self.model.items[indexPath.row])
        
        return cell
    }
    
}

extension SelectableListDataSource: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45.0.pps
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 45.0.pps)
        let headerView = SectionHeaderView(frame: frame)
        headerView.setTitle(model.title)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.model.items[indexPath.row]
        self.selectionAction?(item)
    }
    
}
