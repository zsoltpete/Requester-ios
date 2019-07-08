//
//  CellSeperating.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 07..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

///Add seperator to cells
protocol CellSeperating {
    
    ///Add seperator to cells
    func addSeperator() -> UIView
    
}

extension UITableViewCell: CellSeperating {

    func addSeperator() -> UIView {
        let frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: 1)
        let seperatorView = UIView(frame: frame)
        self.addSubview(seperatorView)
        return seperatorView
    }
    
}
