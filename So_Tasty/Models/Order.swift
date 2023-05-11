//
//  Order.swift
//  So_Tasty
//
//  Created by apple on 08.05.2023.
//

import Foundation

struct Order: Decodable {
    let id: String?
    let name: String?
    let dish: Dish?
}
