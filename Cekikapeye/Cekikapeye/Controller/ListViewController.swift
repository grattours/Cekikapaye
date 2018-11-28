//
//  ListViewController.swift
//  Cekikapeye
//
//  Created by Ambroise COLLON on 21/05/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var spendings = Spending.all
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        spendings = Spending.all
        tableView.reloadData()
    }
}

extension ListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return spendings.count  // premier niveau = section
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spendings[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpendingCell", for: indexPath)

        let spending = spendings[indexPath.section][indexPath.row]
        cell.textLabel?.text = spending.content
//        let currency = UserDefaults.standard.string(forKey: "currency") ?? "€"
        let currency = SettingService.currency
        cell.detailTextLabel?.text = "\(spending.amount) \(currency)"
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        guard let person = spendings[section].first?.person, let name = person.name else {
            return nil
        }
        var totalAmount = 0.0
        for spending in spendings[section] {
            totalAmount += spending.amount
            }
        return name + " \(totalAmount) \(SettingService.currency)"
    }
}
