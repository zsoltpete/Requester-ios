//
//  Theme
//  ChuckNorrisFacts
//
//  Created by Zsolt Pete on 2019. 05. 12..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//
// swiftlint:disable disable_uicolor

import Foundation
import RxSwift
import RxTheme
import UIKit

protocol Theme {
    var backgroundColor: UIColor { get }
    var primaryTextColor: UIColor { get }
    var borderColor: UIColor { get }
    var lowPercentColor: UIColor { get }
    var highPercentColor: UIColor { get }
    var dividerGray: UIColor { get }
    var buttonBackgroundColor: UIColor { get }
    var buttonBorderColor: UIColor { get }
    var rPopUpBackground: UIColor { get }
}

struct LightTheme: Theme {
    let backgroundColor = Colors.BackGroundColor.light
    let primaryTextColor = Colors.PrimaryTextColor.light
    let borderColor = Colors.BorderedImageBorderColor.light
    let lowPercentColor = Colors.LowPercentColor.light
    let highPercentColor = Colors.HighPercentColor.light
    var dividerGray = Colors.DividerColor.light
    var buttonBorderColor = Colors.RButtonBorderColor.light
    var buttonBackgroundColor = Colors.RButtonBackgroundColor.light
    var rPopUpBackground = Colors.RPopUpBackgroundColor.light
}

struct DarkTheme: Theme {
    let backgroundColor = Colors.BackGroundColor.dark
    let primaryTextColor = Colors.PrimaryTextColor.dark
    let borderColor = Colors.BorderedImageBorderColor.dark
    let lowPercentColor = Colors.LowPercentColor.dark
    let highPercentColor = Colors.HighPercentColor.dark
    var dividerGray = Colors.DividerColor.dark
    var buttonBorderColor = Colors.RButtonBorderColor.dark
    var buttonBackgroundColor = Colors.RButtonBackgroundColor.dark
    var rPopUpBackground = Colors.RPopUpBackgroundColor.dark
}

enum ThemeType: ThemeProvider {
    case light, dark
    
    var associatedObject: Theme {
        switch self {
        case .light:
            return LightTheme()
        case .dark:
            return DarkTheme()
        }
    }
}

func themed<T>(_ mapper: @escaping ((Theme) -> T)) -> Observable<T> {
    return AppDelegate.shared.themeService.attrStream(mapper)
}
