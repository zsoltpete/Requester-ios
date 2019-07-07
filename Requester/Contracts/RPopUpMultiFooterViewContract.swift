//
//  RPopUpMultiFooterViewContract.swift
//  Requester
//
//  Created by Zsolt Pete on 2019. 07. 07..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

protocol RPopUpMultiFooterViewConstract {
    
    ///Set Agree button title
    func setAgreeButtonTitle(_ title: String)
    
    ///Set Agree button's action
    func setAgreeButtonAction(_ action: DefaultCompletion?)
    
    ///Set Never button title
    func setNeverButtonTitle(_ title: String)
    
    ///Set Never button's action
    func setNeverButtonAction(_ action: DefaultCompletion?)
    
    ///Set Disagree button title
    func setDisagreeButtonTitle(_ title: String)
    
    ///Set Disagree button's action
    func setDisagreeButtonAction(_ action: DefaultCompletion?)
    
}
