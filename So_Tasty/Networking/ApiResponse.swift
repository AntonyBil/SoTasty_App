//
//  ApiResponse.swift
//  So_Tasty
//
//  Created by apple on 10.05.2023.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let messege: String?
    let data: T?
    let error: String?
}
