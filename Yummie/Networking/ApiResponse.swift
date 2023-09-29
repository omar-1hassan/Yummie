//
//  ApiResponse.swift
//  Yummie
//
//  Created by mac on 28/09/2023.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable{
    
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}

