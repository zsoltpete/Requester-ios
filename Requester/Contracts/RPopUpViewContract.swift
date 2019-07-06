//
//  RPopUpViewContract.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 05..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

protocol RPopUpViewContract: BaseTableViewContract {
    
    ///Bind pop up with model
    func bind(_ model: RPopUpViewBindable)
    
    ///Pop up will animate in
    func animateIn()
    
    ///Pop up will be duisappeared
    func animateOut()
    
    ///Update height from content
    func updateHeight()
    
    ///Set agree button action
    func setAgreeCompletition(_ completition: DefaultCompletion?)
    
    ///Set disagree button action
    func setDisagreeCompletition(_ completition: DefaultCompletion?)
    
    ///Set never button action
    func setNeverCompletition(_ completition: DefaultCompletion?)
    
}
