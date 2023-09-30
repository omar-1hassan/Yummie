//
//  UserDefualts+Extensions.swift
//  Yummie
//
//  Created by mac on 30/09/2023.
//

import Foundation

extension UserDefaults {
    
    private enum UserDefaultsKeys: String {
        case hasOnBoarded
    }
    
    var hasOnBoarded: Bool {
        get {
            bool(forKey: UserDefaultsKeys.hasOnBoarded.rawValue)
        }
        set {
            setValue(newValue, forKey: UserDefaultsKeys.hasOnBoarded.rawValue)
        }
    }
}
