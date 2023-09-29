//
//  AppError.swift
//  Yummie
//
//  Created by mac on 27/09/2023.
//

import Foundation

enum AppError: LocalizedError {
    
    case errorDecoding
    case unknown
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
            
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknown:
            return " Bruhhh! ! ! I have no idea what is going on"
        case .invalidUrl:
            return "HEYYY! ! ! Give me invalid URL"
        case .serverError(let error):
            return error
        }
    }
    
}

