//
//  AddSpendingViewController.swift
//  Cekikapeye
//
//  Created by Ambroise COLLON on 21/05/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import UIKit

class AddSpendingViewController: UIViewController {
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var personPickerView: UIPickerView!
    
    var persons = Person.all
    
    @IBAction func save() {
        guard let content = contentTextField.text,
            let amountText = amountTextField.text,
            let amount = Double(amountText) else {
                return
        }

        let spending = Spending(content: content, amount: amount)
        SpendingService.shared.add(spending: spending)
        navigationController?.popViewController(animated: true)
    }
}

extension AddSpendingViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return persons.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return persons[row].name
    }
}

extension AddSpendingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func hideKeyboard(_ sender: UITapGestureRecognizer) {
        contentTextField.resignFirstResponder()
        amountTextField.resignFirstResponder()
    }
}
