//
//  Orders.swift
//  Yummie
//
//  Created by mac on 26/09/2023.
//

import Foundation

struct Order: Decodable {
    let id: String?
    let name: String?
    let dish: Dish?
}
