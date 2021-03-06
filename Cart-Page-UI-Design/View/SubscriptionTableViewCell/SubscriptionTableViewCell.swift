//
//  SubscriptionTableViewCell.swift
//  Cart-Page-UI-Design
//
//  Created by ADMIN on 05/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit
import DropDown

class SubscriptionTableViewCell: UITableViewCell {
    
    static let identifier = "SubscriptionTableViewCell"

    @IBOutlet weak var weaklyButton: UIButton!
    @IBOutlet weak var monthlyButton: UIButton!
    @IBOutlet weak var dayDropDownButton: UIButton!
    
    let dayDropDown = DropDown()
    
    
    var weakly = true {
        didSet{
            if weakly {
                print("Weakly")
            }else{
                print("Monthly")
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        weaklyButton.addTarget(self, action: #selector(didTapWeaklyButton(_ :)), for: .touchUpInside)
        monthlyButton.addTarget(self, action: #selector(didTapMonthlyButton(_ :)), for: .touchUpInside)
        
        dayDropDownButton.addTarget(self, action: #selector(chooseDay), for: .touchUpInside)
        
        dayDropDown.anchorView = dayDropDownButton
        dayDropDown.bottomOffset = CGPoint(x: 0, y: dayDropDown.bounds.height)
        
        dayDropDown.dataSource = [
            Day.Monday.rawValue,
            Day.Tuesday.rawValue,
            Day.Wednesday.rawValue,
            Day.Thursday.rawValue,
            Day.Friday.rawValue,
            Day.Saturday.rawValue,
            Day.Sunday.rawValue,
        ]
    }
    
    @objc func chooseDay() {
        dayDropDown.show()
    }
    
    @objc func didTapWeaklyButton(_ sender: UIButton) {
        weakly = true
        weaklyButton.setImage(#imageLiteral(resourceName: "radio btn-check-ai"), for: .normal)
        monthlyButton.setImage(#imageLiteral(resourceName: "un-check-circle-ai"), for: .normal)
    }
    
    @objc func didTapMonthlyButton(_ sender: UIButton) {
        weakly = false
        weaklyButton.setImage(#imageLiteral(resourceName: "un-check-circle-ai"), for: .normal)
        monthlyButton.setImage(#imageLiteral(resourceName: "radio btn-check-ai"), for: .normal)
    }
    
}
