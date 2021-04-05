//
//  RatioExtension.swift
//  YogaExplore
//
//  Created by Hitesh Khunt on 02/10/20.
//

import Foundation
import UIKit

/*---------------------------------------------------
Screen Size
---------------------------------------------------*/
let _screenSize     = UIScreen.main.bounds.size
let _screenFrame    = UIScreen.main.bounds

/*---------------------------------------------------
 Ratio
 ---------------------------------------------------*/
let _heightRatio : CGFloat = {
    let ratio = _screenSize.height/667
    return ratio
}()

let _widthRatio : CGFloat = {
    let ratio = _screenSize.width/375
    return ratio
}()

extension CGFloat {

    var widthRatio: CGFloat{
        return self * _widthRatio
    }

    var heightRatio: CGFloat{
        return self * _heightRatio
    }
}

extension Int {
    
    var widthRatio: CGFloat{
        return CGFloat(self) * _widthRatio
    }
    
    var heightRatio: CGFloat{
        return CGFloat(self) * _heightRatio
    }
}
