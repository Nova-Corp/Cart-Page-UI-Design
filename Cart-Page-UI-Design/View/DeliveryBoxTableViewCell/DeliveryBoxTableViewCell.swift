//
//  DeliveryBoxTableViewCell.swift
//  Cart-Page-UI-Design
//
//  Created by ADMIN on 06/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class DeliveryBoxTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var firstProductCount: UITextField!
    @IBOutlet weak var secondProductCount: UITextField!
    
    static let identifier = "DeliveryBoxTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    func configureDeliveryProductCell(_ product: DeliveryBox) {
        firstProductCount.text = "\(product.firstProductCount ?? 0)"
        secondProductCount.text = "\(product.secondProductCount ?? 0)"
    }
    
}
