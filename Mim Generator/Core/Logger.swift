//
//  Logger.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 08/02/22.
//

import Foundation

enum Logger {
    static func inspect(key: String, value: Any) {
        print("😎 \(key): \(value)")
    }
}
