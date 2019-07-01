//
//  Utilities
//  Requester
//
//  Created by Zsolt Pete on 2019. 06. 28..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//

import UIKit

/// Deliver fonts which app can use
class FontDeliver {
    
    static func system(sizeOf: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: sizeOf)
    }
    
    static func semiBoldSystem(sizeOf: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: sizeOf, weight: .semibold)
    }
    
    static func boldSystem(sizeOf: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: sizeOf, weight: .bold)
    }
    
}
