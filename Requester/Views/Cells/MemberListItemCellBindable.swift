//
//  MemberListItemCellBindable.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 29..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation
import UIKit

protocol MemberListItemCellBindable {
    
    var pImageSrc: String { get }
    var pName: String { get }
    var pMoralPercent: Int { get }

}
