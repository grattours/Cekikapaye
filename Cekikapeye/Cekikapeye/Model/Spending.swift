//
//  Spending.swift
//  Cekikapeye
//
//  Created by Ambroise COLLON on 21/05/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import Foundation
import CoreData


class Spending: NSManagedObject {
    static var all: [[Spending]] {
        let request: NSFetchRequest<Spending> = Spending.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(key: "person.name", ascending: true),
            NSSortDescriptor(key: "amount", ascending: true)
        ]
        
        guard let spendings = try? AppDelegate.viewContext.fetch(request) else {
            return []
        }
        return spendings.convertedToArrayOfArray
  }
}

extension Array where Element == Spending {
    var convertedToArrayOfArray: [[Spending]] {
        var dict = [Person: [Spending]]()
        
        for spending in self where spending.person != nil {
            dict[spending.person!, default: []].append(spending)
        }
        
        var result = [[Spending]]()
        for (_, val) in dict {
            result.append(val)
        }
        
        return result
    }
}

