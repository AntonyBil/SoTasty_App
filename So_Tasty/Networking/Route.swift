//
//  Route.swift
//  So_Tasty
//
//  Created by apple on 08.05.2023.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    
    case temp
    
    var  description: String {
        switch self {
        case .temp:
            return "/dish-categories"
        }
    }
}
