//
//  Utilities
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 28..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import Foundation

/// Constains notification which will be posted in the app
struct Events {
    
    static let ShowMemberDetailView = Notification.Name(rawValue: "ShowMemberDetailView")
    static let ShowRequestSendingView = Notification.Name(rawValue: "ShowRequestSendingView")
    static let RequestSent = Notification.Name(rawValue: "RequestSent")
    
}
