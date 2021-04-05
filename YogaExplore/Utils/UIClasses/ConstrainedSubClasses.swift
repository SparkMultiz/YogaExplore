//
//  ConstrainedSubClasses.swift
//  YogaExplore
//
//  Created by Hitesh Khunt on 02/10/20.
//

import UIKit

//MARK :- UIButton
class HKWidthButton: UIButton {
    
    @IBInspectable public var isViewRound: Bool {
        get { return (layer.cornerRadius == (frame.size.width/2) ) || (layer.cornerRadius == (frame.size.height/2)) }
        set { layer.cornerRadius = newValue == true ? (frame.size.height/2) : layer.cornerRadius }
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
    
    override func awakeFromNib() {
        if let img = self.imageView{
            let btnsize = self.frame.size
            let imgsize = img.frame.size
            let verPad = (((btnsize.height * _widthRatio) - (imgsize.height * _widthRatio)) / 2)
            self.imageEdgeInsets = UIEdgeInsets(top: verPad, left: 0, bottom: verPad, right: 0)
            self.imageView?.contentMode = .scaleAspectFit
        }
        if let afont = titleLabel?.font {
            titleLabel?.font = afont.withSize(afont.pointSize * _widthRatio)
        }
    }
}

//MARK :- UILabel

class HKWidthLabel: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        font = font.withSize(font.pointSize * _widthRatio)
    }
}

class ConstrainedView: UIView {
    
    // MARK: Outlets
    @IBOutlet var horizontalConstraints: [NSLayoutConstraint]?
    @IBOutlet var verticalConstraints: [NSLayoutConstraint]?
    
    // MARK: Awaken
    override func awakeFromNib() {
        super.awakeFromNib()
        constraintUpdate()
    }
    
    func constraintUpdate() {
        if let hConts = horizontalConstraints {
            for const in hConts {
                let v1 = const.constant
                let v2 = v1 * _widthRatio
                const.constant = v2
            }
        }
        if let vConst = verticalConstraints {
            for const in vConst {
                let v1 = const.constant
                let v2 = v1 * _heightRatio
                const.constant = v2
            }
        }
    }
}

/// This Table view cell contains collection of Horizontal and Vertical constrains. Who's constant value varies by size of device screen size.
class ConstrainedTableViewCell: UITableViewCell {
    
    @IBOutlet var horizontalConstraints: [NSLayoutConstraint]?
    @IBOutlet var verticalConstraints: [NSLayoutConstraint]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        constraintUpdate()
    }
    
    // This will update constaints and shrunk it as device screen goes lower.
    func constraintUpdate() {
        if let hConts = horizontalConstraints {
            for const in hConts {
                let v1 = const.constant
                let v2 = v1 * _widthRatio
                const.constant = v2
            }
        }
        if let vConst = verticalConstraints {
            for const in vConst {
                let v1 = const.constant
                let v2 = v1 * _heightRatio
                const.constant = v2
            }
        }
    }
}
