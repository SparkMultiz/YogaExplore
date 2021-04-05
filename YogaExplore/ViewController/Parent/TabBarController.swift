//
//  TabBarController.swift
//  YogaExplore
//
//  Created by Hitesh Khunt on 02/10/20.
//

import UIKit

// MARK: - Custom TabBar Controller
class TabBarController: UITabBarController {

    var tabBarView: TabBarView!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
}

// MARK: - TabBar UI Methods
extension TabBarController {
    
    func prepareUI() {
        tabBar.isHidden = true
        addCustomTabBar()
    }
    
    // MARK: - Custom TabBar Implementation from XIB
    func addCustomTabBar() {
        let baseView = UIView()
    
        baseView.frame = CGRect(x: 0, y: (_screenSize.height - 70.widthRatio) - _bottomAreaSpacing, width: _screenSize.width, height: 70.widthRatio + _bottomAreaSpacing)
      
        baseView.applyShadow()
        
        tabBarView = TabBarView.instantiateTabBarView()
        
        tabBarView.frame = baseView.bounds
        
        tabBarView.roundCorners(corners: [.topLeft, .topRight], radius: (baseView.frame.size.height) / 2)
        
        tabBarView.getSelectedIndex { (index) in
            self.selectedIndex = index
        }
        
        baseView.addSubview(tabBarView)
        view.addSubview(baseView)
    }
}
