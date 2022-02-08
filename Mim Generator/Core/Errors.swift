//
//  Errors.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 08/02/22.
//

import Foundation

enum ErrorResult: Error, Equatable {
    case generalError(message: String?)
    case noInternet
    case dataNil
    case parsingFailure
}
