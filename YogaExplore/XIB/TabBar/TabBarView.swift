//
//  TabBarView.swift
//  YogaExplore
//
//  Created by Hitesh Khunt on 02/10/20.
//

import UIKit

class TabBarView: ConstrainedView {

    @IBOutlet var tabBtns: [UIButton]!
    @IBOutlet var tabLbls: [UILabel]!
    
   var selectedTabIndex: (Int) -> Void = {_  in}

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension TabBarView {
    
    class func instantiateTabBarView() -> TabBarView {
        let objView = UINib(nibName: "TabBarView", bundle: nil).instantiate(withOwner: self, options: nil).first as! TabBarView
        return objView
    }
    
    func getSelectedIndex(completion: @escaping(Int) -> ()) {
        self.selectedTabIndex = completion
    }
    
    func setSelectedTab(ind: Int) {
        for(idx,btn) in tabBtns.enumerated() {
            if idx == ind {
                btn.isSelected = true
                tabLbls[idx].textColor = UIColor(named: "ColorPink")
                tabLbls[idx].font = UIFont.YogaExploreFontWith(.UbuntuMedium, size: 14.widthRatio)
            } else {
                btn.isSelected = false
                tabLbls[idx].textColor = UIColor(named: "ColorLabel")
                tabLbls[idx].font = UIFont.YogaExploreFontWith(.UbuntuRegular, size: 14.widthRatio)
            }
        }
        selectedTabIndex(ind)
    }
}

extension TabBarView {
    
    @IBAction func btnTabChanged(_ sender: UIButton) {
        setSelectedTab(ind: sender.tag)
    }
}
