//
//  ViewController.swift
//  Cart-Page-UI-Design
//
//  Created by ADMIN on 05/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    @IBOutlet var cartTableView: UITableView!

    var deliveryBoxCount = 1 {
        didSet {
            cartTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        cartTableView.delegate = self
        cartTableView.dataSource = self

        cartTableView.tableFooterView = UIView()

        registerTableViewCell()
    }

    fileprivate func registerTableViewCell() {
        //        MARK: - Register DeliveryTimeTableViewCell Nib

        let deliveryTimeNib = UINib(nibName: DeliveryTimeTableViewCell.identifier, bundle: nil)
        cartTableView.register(deliveryTimeNib, forCellReuseIdentifier: DeliveryTimeTableViewCell.identifier)

        //        MARK: - Register DeliveryTimeTableViewCell Nib

        let personalInfoNib = UINib(nibName: PersonalInfoTableViewCell.identifier, bundle: nil)
        cartTableView.register(personalInfoNib, forCellReuseIdentifier: PersonalInfoTableViewCell.identifier)

        //        MARK: - Register SubscriptionTableViewCell Nib

        let subscriptionNib = UINib(nibName: SubscriptionTableViewCell.identifier, bundle: nil)
        cartTableView.register(subscriptionNib, forCellReuseIdentifier: SubscriptionTableViewCell.identifier)

        //        MARK: - Register DeliveryBoxTableViewCell Nib

        let deliveryBoxNib = UINib(nibName: DeliveryBoxTableViewCell.identifier, bundle: nil)
        cartTableView.register(deliveryBoxNib, forCellReuseIdentifier: DeliveryBoxTableViewCell.identifier)

        //        MARK: - Register CustomOrderTableViewCell Nib

        let customOrderNib = UINib(nibName: CustomOrderTableViewCell.identifier, bundle: nil)
        cartTableView.register(customOrderNib, forCellReuseIdentifier: CustomOrderTableViewCell.identifier)
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return deliveryBoxCount
        case 2:
            return 1
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                let deliveryTimeCell = tableView.dequeueReusableCell(withIdentifier: DeliveryTimeTableViewCell.identifier, for: indexPath) as! DeliveryTimeTableViewCell
                return deliveryTimeCell
            case 1:
                let personalInfoCell = tableView.dequeueReusableCell(withIdentifier: PersonalInfoTableViewCell.identifier, for: indexPath) as! PersonalInfoTableViewCell
                return personalInfoCell
            case 2:
                let subscriptionCell = tableView.dequeueReusableCell(withIdentifier: SubscriptionTableViewCell.identifier, for: indexPath) as! SubscriptionTableViewCell
                return subscriptionCell

            default:
                return UITableViewCell()
            }
        } else if indexPath.section == 1 {
            let deliveryBoxCell = tableView.dequeueReusableCell(withIdentifier: DeliveryBoxTableViewCell.identifier, for: indexPath) as! DeliveryBoxTableViewCell
            return deliveryBoxCell
        } else if indexPath.section == 2 {
            let customOrderCell = tableView.dequeueReusableCell(withIdentifier: CustomOrderTableViewCell.identifier, for: indexPath) as! CustomOrderTableViewCell
            customOrderCell.addDeliveryBoxButton.addTarget(self, action: #selector(didTapAddDeliveryBoxButton), for: .touchUpInside)
            return customOrderCell
        }

        return UITableViewCell()
    }

    @objc func didTapAddDeliveryBoxButton() {
        deliveryBoxCount += 1
    }
}
