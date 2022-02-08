//
//  ListMemeRepository.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 08/02/22.
//

import Foundation

protocol ListMemeRepository {
  func getMemes(
    completion: @escaping (Result<[Meme], ErrorResult>) -> Void
  )
}
