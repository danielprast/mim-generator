//
//  ListMemeService.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 08/02/22.
//

import Foundation

protocol ListMemeService {
  func fetchMemes(
    completion: @escaping ((Result<ListImage.FetchImages.Response.Root, ErrorResult>) -> Void)
  )
}

final class ListMemeServiceImpl: ListMemeService {
  init(api: BaseAPIService) {
    apiService = api
  }
  
  convenience init(container: DICProtocol) {
    self.init(api: container.resolve(type: BaseAPIService.self)!)
  }
  
  private let apiService: BaseAPIService
  
  func fetchMemes(
    completion: @escaping ((Result<ListImage.FetchImages.Response.Root, ErrorResult>) -> Void)
  ) {
    let urlString = "\(AppConfig.shared.baseURL)/\(AppConfig.Endpoints.getMemes.rawValue)"
    apiService.request(urlString: urlString, completion: completion)
  }
}


