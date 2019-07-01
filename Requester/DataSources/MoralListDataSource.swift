//
//  MoralListDataSource.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 30..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

class MoralListDataSource: NSObject {
    
    private var dataSource: [MoralledItemCellBindable] = [MoralledItemCellBindable]()
    
    func setDataSource(_ dataSource: [MoralledItemCellBindable]) {
        self.dataSource = dataSource
    }
    
}

extension MoralListDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.MoralledItemCell, for: indexPath) as? MoralledItemCell else {
            return UITableViewCell()
        }
        let model = self.dataSource[indexPath.row]
        cell.bind(model)
        
        return cell
    }
    
}

extension MoralListDataSource: UITableViewDelegate {
    
}
