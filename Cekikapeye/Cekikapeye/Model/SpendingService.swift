//
//  SpendingService.swift
//  Cekikapeye
//
//  Created by Ambroise COLLON on 21/05/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import Foundation

class SpendingService {
    static var shared = SpendingService()
    private init() {}

    private(set) var spendings = [Spending]()

    func add(spending: Spending) {
        spendings.append(spending)
    }
}
