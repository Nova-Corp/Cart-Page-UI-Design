//
//  CustomOrderTableViewCell.swift
//  Cart-Page-UI-Design
//
//  Created by ADMIN on 06/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class CustomOrderTableViewCell: UITableViewCell {
    static let identifier = "CustomOrderTableViewCell"

    @IBOutlet var addDeliveryBoxButton: UIButton!

    @IBOutlet var onlineButton: UIButton!
    @IBOutlet var codButton: UIButton!
    @IBOutlet var walletButton: UIButton!

    var online = true {
        didSet {
            if online {
                print("Online")
                onlineButton.setImage(#imageLiteral(resourceName: "radio btn-check-ai"), for: .normal)
                codButton.setImage(#imageLiteral(resourceName: "un-check-circle-ai"), for: .normal)
                walletButton.setImage(#imageLiteral(resourceName: "un-check-circle-ai"), for: .normal)
            }
        }
    }

    var cod = false {
        didSet {
            if cod {
                print("COD")
                onlineButton.setImage(#imageLiteral(resourceName: "un-check-circle-ai"), for: .normal)
                codButton.setImage(#imageLiteral(resourceName: "radio btn-check-ai"), for: .normal)
                walletButton.setImage(#imageLiteral(resourceName: "un-check-circle-ai"), for: .normal)
            }
        }
    }

    var wallet = false {
        didSet {
            if wallet {
                print("Wallet")
                onlineButton.setImage(#imageLiteral(resourceName: "un-check-circle-ai"), for: .normal)
                codButton.setImage(#imageLiteral(resourceName: "un-check-circle-ai"), for: .normal)
                walletButton.setImage(#imageLiteral(resourceName: "radio btn-check-ai"), for: .normal)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        onlineButton.addTarget(self, action: #selector(didTapOnlineButton), for: .touchUpInside)
        codButton.addTarget(self, action: #selector(didTapCodButton), for: .touchUpInside)
        walletButton.addTarget(self, action: #selector(didTapWalletButton), for: .touchUpInside)
    }

    @objc func didTapOnlineButton() {
        online = true
        cod = false
        wallet = false
    }

    @objc func didTapCodButton() {
        online = false
        cod = true
        wallet = false
    }

    @objc func didTapWalletButton() {
        online = false
        cod = false
        wallet = true
    }
}
