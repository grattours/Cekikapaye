//
//  PeopleTableViewController.swift
//  Cekikapeye
//
//  Created by Ambroise COLLON on 24/05/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import UIKit
import CoreData

class PeopleViewController: UIViewController {
    @IBOutlet weak var peopleTextView: UITextView!
    @IBOutlet weak var peopleTextField: UITextField!
    
    fileprivate func displayPeopleList() {
        //        let request: NSFetchRequest<Person> = Person.fetchRequest()
        //        guard let persons = try? AppDelegate.viewContext.fetch(request) else {
        //            return
        //        }
        var peopleText = ""
        for person in Person.all {
            if let name = person.name {
                peopleText += name + "\n"
            }
        }
        peopleTextView.text = peopleText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayPeopleList()
    }
    
    @IBAction func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}

extension PeopleViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        addPerson()
        return true
    }

    private func addPerson() {
        guard let personName = peopleTextField.text,
            var people = peopleTextView.text else {
                return
        }

        people += personName + "\n"
        peopleTextView.text = people
        peopleTextField.text = ""

        savePerson(named:  personName)
    }
    
    private func savePerson(named name: String) {
        let person = Person(context: AppDelegate.viewContext)
        person.name =  name
        try? AppDelegate.viewContext.save()
    }
}
