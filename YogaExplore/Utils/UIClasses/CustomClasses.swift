//
//  CustomClasses.swift
//  YogaExplore
//
//  Created by Hitesh Khunt on 02/10/20.
//

import UIKit

// MARK: - Base Class of UIView
class BaseView: UIView {
    
    @IBInspectable public var isRound: Bool {
        get { return (layer.cornerRadius == (frame.size.width/2) * _widthRatio) || (layer.cornerRadius == (frame.size.height/2) * _heightRatio) }
        set { layer.cornerRadius = newValue == true ? (frame.size.height/2) * _widthRatio : layer.cornerRadius }
    }
    @IBInspectable public var isViewRound: Bool {
        get { return (layer.cornerRadius == (frame.size.width/2) ) || (layer.cornerRadius == (frame.size.height/2)) }
        set { layer.cornerRadius = newValue == true ? (frame.size.height/2) : layer.cornerRadius }
    }
    @IBInspectable public var borderWidth: CGFloat {
        get { return self.layer.borderWidth }
        set { self.layer.borderWidth = newValue }
    }
    @IBInspectable public var borderColor: UIColor {
        get { return self.layer.borderColor == nil ? UIColor.clear : UIColor(cgColor: self.layer.borderColor!) }
        set { self.layer.borderColor = newValue.cgColor }
    }
    @IBInspectable public var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    @IBInspectable public var shadowRadius: CGFloat {
        get { return layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }
    @IBInspectable public var shadowOpacity: Float {
        get { return layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }
    @IBInspectable public var shadowColor: UIColor? {
        get { return layer.shadowColor != nil ? UIColor(cgColor: layer.shadowColor!) : nil }
        set { layer.shadowColor = newValue?.cgColor }
    }
    @IBInspectable public var shadowOffset: CGSize {
        get { return layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
    @IBInspectable public var zPosition: CGFloat {
        get { return layer.zPosition }
        set { layer.zPosition = newValue }
    }
}

// MARK: - RoundView
class HKRoundView: UIView {
    
    @IBInspectable var isRatioAppliedOnSize: Bool = false
    
    @IBInspectable var cornerRadious: CGFloat = 0 {
        didSet{
            if cornerRadious == 0 {
                layer.cornerRadius = isRatioAppliedOnSize ? (self.frame.height * _widthRatio) / 2 : self.frame.height / 2
            }else{
                layer.cornerRadius = isRatioAppliedOnSize ? cornerRadious * _widthRatio : cornerRadious
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = true
    }
}
