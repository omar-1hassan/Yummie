//
//  String+Extension.swift
//  Yummie
//
//  Created by mac on 25/09/2023.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
