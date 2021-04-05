//
//  UIFontExtension.swift
//  YogaExplore
//
//  Created by Hitesh Khunt on 02/10/20.
//

import UIKit

// MARK: - App Font Extension
enum YogaExploreFont: String {
    
    case UbuntuLight = "Ubuntu-Light"
    case UbuntuRegular = "Ubuntu-Regular"
    case UbuntuMedium = "Ubuntu-Medium"
    case UbuntuBold = "Ubuntu-Bold"
    
}

extension UIFont {
    
    class func YogaExploreFontWith(_ name: YogaExploreFont, size: CGFloat) -> UIFont{
        return UIFont(name: name.rawValue, size: size)!
    }
}
