//
//  CardView.swift
//  Cart-Page-UI-Design
//
//  Created by ADMIN on 05/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCard()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureCard()
    }
    
    func configureCard() {
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }
}



