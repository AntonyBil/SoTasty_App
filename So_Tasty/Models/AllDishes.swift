//
//  AllDishes.swift
//  So_Tasty
//
//  Created by apple on 11.05.2023.
//

import Foundation

struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
