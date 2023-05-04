//
//  Dish.swift
//  So_Tasty
//
//  Created by apple on 04.05.2023.
//

import Foundation

struct Dish {
    let id: String?
    let name: String?
    let description: String?
    let image: String?
    let calories: Double?
    
    var formattedCalories: String {
        return String(format: "%2f", calories ?? 0)
    }
}
