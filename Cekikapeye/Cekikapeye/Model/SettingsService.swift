//
//  SettingsService.swift
//  Cekikapeye
//
//  Created by Luc Derosne on 11/10/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import Foundation

class SettingService {
    private struct Keys {
        static let currency = "currency"
    }
    
    static var currency: String {
        get {
            return UserDefaults.standard.string(forKey: Keys.currency) ?? "€"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.currency)
        }
    }
}

