//
//  Usecase.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 08/02/22.
//

import Foundation

protocol UseCase {
  associatedtype ResultType
  associatedtype Param
  associatedtype ErrorCase: Error
  
  func execute(
    param: Param,
    completion: @escaping(Result<ResultType, ErrorCase>) -> Void
  )
}
