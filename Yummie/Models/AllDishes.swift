//
//  AllDishes.swift
//  Yummie
//
//  Created by mac on 28/09/2023.
//

import Foundation

struct AllDishes: Decodable{
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}

