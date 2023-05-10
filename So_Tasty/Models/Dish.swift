//
//  Dish.swift
//  So_Tasty
//
//  Created by apple on 04.05.2023.
//

import Foundation

struct Dish: Decodable {
    let id: String?
    let name: String?
    let description: String?
    let image: String?
    let calories: Int?
    
    
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
        
       // return String(format: "%.1f calories", calories ?? 0)
    }
}
