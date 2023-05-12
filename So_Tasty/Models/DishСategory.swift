//
//  Dishcategory.swift
//  So_Tasty
//
//  Created by apple on 03.05.2023.
//

import Foundation

struct DishCategory: Decodable {
    let id: String?
    let title: String?
    let image: String?
    
    /*variant to change name for decoding json
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case immage
    } */
}
