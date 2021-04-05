//
//  YogaTableCell.swift
//  YogaExplore
//
//  Created by Hitesh Khunt on 02/10/20.
//

import UIKit

class YogaTableCell: ConstrainedTableViewCell {
    
    @IBOutlet weak var yogaGradientView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var reviewView: HKRoundView!
    
    @IBOutlet weak var widthStarView: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - Prepare Cell UI
    func prepareYogaCellUI(type: EnumYogaCells) {
        switch type {
        case .headerCell:
            setHeaderCellUI()
        default:
            break
        }
    }
}

// MARK: - Cell UI Methods
extension YogaTableCell {
    
    func setHeaderCellUI() {
        yogaGradientView.applyGradientEffects([#colorLiteral(red: 0.6941176471, green: 0.6980392157, blue: 0.7019607843, alpha: 0.9), UIColor.clear], gradientPoint: VBGradientPoint.topBottom)
        self.headerView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 55.0)
        self.startAnimation()
    }
    
    private func startAnimation() {
        self.headerView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        self.headerView.animateTo(frame: CGRect(x: 0, y: self.headerView.frame.size.height, width: self.headerView.frame.size.width, height: self.headerView.frame.size.height), withDuration: 0.3) { (completion) in
            self.headerView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.layoutIfNeeded()
        }
        
        let newConstraint = widthStarView.constraintWithMultiplier(1.0)
        self.reviewView.removeConstraint(widthStarView)
        self.reviewView.addConstraint(newConstraint)
        self.reviewView.layoutIfNeeded()
        widthStarView = newConstraint
        UIView.animate(withDuration: 0.5) {
            let newConstraint = self.widthStarView.constraintWithMultiplier(5.0)
            self.reviewView.removeConstraint(self.widthStarView)
            self.reviewView.addConstraint(newConstraint)
            self.reviewView.layoutIfNeeded()
            self.widthStarView = newConstraint
        }
    }
    
    func reverseAnimation(completion: @escaping () -> ()) {
        self.headerView.transform = CGAffineTransform.identity
        UIView.animate(withDuration: 0.3) {
            self.headerView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        }
        let newConstraint = widthStarView.constraintWithMultiplier(5.0)
        self.reviewView.removeConstraint(widthStarView)
        self.reviewView.addConstraint(newConstraint)
        self.reviewView.layoutIfNeeded()
        widthStarView = newConstraint
        UIView.animate(withDuration: 0.3, animations: {
            let newConstraint = self.widthStarView.constraintWithMultiplier(1.0)
            self.reviewView.removeConstraint(self.widthStarView)
            self.reviewView.addConstraint(newConstraint)
            self.reviewView.layoutIfNeeded()
            self.widthStarView = newConstraint
        }) { (success) in
            completion()
        }
    }
    
}
