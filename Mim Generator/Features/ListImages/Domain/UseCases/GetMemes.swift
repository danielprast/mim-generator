//
//  GetMemes.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 08/02/22.
//

import Foundation

final class GetMemes: UseCase {
  typealias ResultType = [Meme]
  typealias Param = GetMemesParam
  typealias ErrorCase = ErrorResult
  
  init(repository: ListMemeRepository) {
    self.repository = repository
  }
  
  private let repository: ListMemeRepository
  
  func execute(
    param: GetMemesParam,
    completion: @escaping (Result<[Meme], ErrorResult>) -> Void
  ) {
    repository.getMemes(completion: completion)
  }
}

struct GetMemesParam {}
