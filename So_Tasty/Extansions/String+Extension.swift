//
//  String+Extension.swift
//  So_Tasty
//
//  Created by apple on 03.05.2023.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
