//
//  ListMemeRepositoryImplementation.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 08/02/22.
//

import Foundation

final class ListMemeRepositoryImpl: ListMemeRepository {
  
  init(service: ListMemeService) {
    self.service = service
  }
  
  convenience init(container: DICProtocol) {
    self.init(service: container.resolve(type: ListMemeService.self)!)
  }
  
  private let service: ListMemeService
  
  func getMemes(completion: @escaping (Result<[Meme], ErrorResult>) -> Void) {
    service.fetchMemes { result in
      switch result {
      case .success(let data):
        guard let memes = data.data?.memes else {
          completion(.failure(.dataNil))
          return
        }
        completion(.success(memes))
      case .failure(let err):
        completion(.failure(err))
      }
    }
  }
}
