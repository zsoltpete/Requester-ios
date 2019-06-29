//
//  Theme
//  ChuckNorrisFacts
//
//  Created by Zsolt Pete on 2019. 05. 12..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//
//swiftlint:disable disable_uicolor

import UIKit

/// Contains colors of the app
struct Colors {
    
    private static let mainBlue = UIColor(rgb: 0x133D8A)
    private static let mainRed = UIColor(rgb: 0xD62525)
    private static let mainGreen = UIColor(rgb: 0x54C418)
    
    static let BackGroundColor = MixedColor(light: .white, dark: .black)
    static let PrimaryTextColor = MixedColor(light: Colors.mainBlue, dark: Colors.mainBlue)
    static let BorderedImageBorderColor = MixedColor(light: Colors.mainBlue, dark: Colors.mainBlue)
    static let LowPercentColor = MixedColor(light: Colors.mainBlue, dark: Colors.mainBlue)
    static let HighPercentColor = MixedColor(light: Colors.mainBlue, dark: Colors.mainBlue)
    
}
