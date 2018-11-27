//
//  Person.swift
//  Cekikapeye
//
//  Created by Luc Derosne on 26/11/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import Foundation
import CoreData

class Person: NSManagedObject {
    static var all: [Person] {
        let request: NSFetchRequest<Person> = Person.fetchRequest()
        guard let persons = try? AppDelegate.viewContext.fetch(request) else {
            return []
        }
        return persons
    }
}
