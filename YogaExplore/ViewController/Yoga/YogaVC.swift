//
//  YogaVC.swift
//  YogaExplore
//
//  Created by Hitesh Khunt on 02/10/20.
//

import UIKit

// MARK: - Enum YogaTable Cells
enum EnumYogaCells: String, CaseIterable {
    case headerCell = "headerCell"
    case infoCell = "infoCell"
    case timingCell = "timingCell"
    case descCell = "descCell"
    case reviewCell = "reviewCell"
    
    var cellId: String {
        return self.rawValue
    }
    
    var rowCount: Int {
        return 1
    }
    
    var cellHeight: CGFloat {
        switch self {
        case .headerCell:
            return 400.0
        case .infoCell, .descCell:
            return UITableView.automaticDimension
        case .reviewCell:
            return 60.widthRatio
        default:
            return 100.widthRatio
        }
    }
}


class YogaVC: UIViewController {

    @IBOutlet weak var yogaTablView: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
}

// MARK: - UI Methods
extension YogaVC {
    func prepareUI() {
        yogaTablView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: _tabBarHeight + 10, right: 0)
    }
}

// MARK: - UI Actions
extension YogaVC {
    
    @IBAction func btnBackClick(_ sender: Any) {
        guard let cell = yogaTablView.cellForRow(at: IndexPath(row: 0, section: 0)) as? YogaTableCell else {return}
        cell.reverseAnimation {
            self.navigationController?.popViewController(animated: false)
        }
    }
}

// MARK: - TableView DataSource & Delegate Methods
extension YogaVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return EnumYogaCells.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EnumYogaCells.allCases[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return EnumYogaCells.allCases[indexPath.section].cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: YogaTableCell
        let cellId = EnumYogaCells.allCases[indexPath.section].cellId
        cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! YogaTableCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let yogaCell = cell as? YogaTableCell {
            yogaCell.prepareYogaCellUI(type: EnumYogaCells.allCases[indexPath.section])
        }
    }
}
