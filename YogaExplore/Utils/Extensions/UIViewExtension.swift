//
//  UIViewExtension.swift
//  YogaExplore
//
//  Created by Hitesh Khunt on 02/10/20.
//

import UIKit

// MARK: - View Extensions
extension UIView {
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func applyShadow() {
        layer.shadowColor = #colorLiteral(red: 0.7333333333, green: 0.7333333333, blue: 0.7333333333, alpha: 0.35)
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: -5.0)
        layer.shadowRadius = 5
    }
    
    func applyGradientEffects(_ colours: [UIColor], gradientPoint: VBGradientPoint, removeFirstLayer: Bool = true) {
        layoutIfNeeded()
        if let subLayers = layer.sublayers, subLayers.count > 1, removeFirstLayer {
            subLayers.first?.removeFromSuperlayer()
        }
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.startPoint = gradientPoint.draw().startPoint
        gradient.endPoint = gradientPoint.draw().endPoint
        layer.insertSublayer(gradient, at: 0)
    }

}

extension UIView{
    
    func animateTo(frame: CGRect, withDuration duration: TimeInterval, completion: ((Bool) -> Void)? = nil) {
    guard let _ = superview else {
      return
    }
        let xScale = frame.size.width / self.frame.size.width
        let yScale = frame.size.height / self.frame.size.height
        let x = frame.origin.x + (self.frame.width * xScale)/2
        let y = frame.origin.y + (self.frame.height * yScale)/2
        UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: {
            self.layer.position = CGPoint(x: x, y: y)
            self.transform = self.transform.scaledBy(x: xScale, y: yScale)
          }, completion: completion)
    }
}

extension NSLayoutConstraint {
    func constraintWithMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self.firstItem!, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
    }
}
 
//Gradient type
typealias GradientType = (startPoint: CGPoint, endPoint: CGPoint)

//Enum for gradient
enum VBGradientPoint {
    case leftRight
    case rightLeft
    case topBottom
    case bottomTop
    case topLeftBottomRight
    case bottomRightTopLeft
    case topRightBottomLeft
    case bottomLeftTopRight
    func draw() -> GradientType {
        switch self {
        case .leftRight:
            return (startPoint: CGPoint(x: 0.2, y: 0), endPoint: CGPoint(x: 0.2, y: 0.5))
        case .rightLeft:
            return (startPoint: CGPoint(x: 1, y: 0.5), endPoint: CGPoint(x: 0, y: 0.5))
        case .topBottom:
            return (startPoint: CGPoint(x: 0.3, y: 0), endPoint: CGPoint(x: 0.3, y: 0.25))
        case .bottomTop:
            return (startPoint: CGPoint(x: 0.5, y: 1), endPoint: CGPoint(x: 0.5, y: 0))
        case .topLeftBottomRight:
            return (startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 1))
        case .bottomRightTopLeft:
            return (startPoint: CGPoint(x: 1, y: 1), endPoint: CGPoint(x: 0, y: 0))
        case .topRightBottomLeft:
            return (startPoint: CGPoint(x: 1, y: 0), endPoint: CGPoint(x: 0, y: 1))
        case .bottomLeftTopRight:
            return (startPoint: CGPoint(x: 0, y: 1), endPoint: CGPoint(x: 1, y: 0))
        }
    }
}
