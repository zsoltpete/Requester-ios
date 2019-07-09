//
//  RInputViewContract.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 08..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

protocol RInputViewContract {
    
    ///Set header view's title
    func setHeaderTitle(_ title: String)
    
    ///Get input text
    func getText() -> String
    
}
