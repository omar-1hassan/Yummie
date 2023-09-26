//
//  Dish.swift
//  Yummie
//
//  Created by mac on 25/09/2023.
//

import Foundation
 
struct Dish {
    let id: String?
    let name: String?
    let discription: String?
    let image: String?
    let calories: Int?
    
    var formatedCalory: String {
        return "\(calories ?? 0) Calories"
    }
    
}
