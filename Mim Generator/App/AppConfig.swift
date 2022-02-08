//
//  AppConfig.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 08/02/22.
//

import Foundation
import UIKit

final class AppConfig {
  static let shared = AppConfig()
  private init() {}
  
  var rootViewController: UIViewController {
    get {
      UINavigationController(
        rootViewController: MemesCollection(collectionViewLayout: UICollectionViewFlowLayout())
      )
    }
  }
  
  var baseURL: String {
    get { "https://api.imgflip.com/" }
  }
  
  enum Endpoints: String, CaseIterable {
    case getMemes = "get_memes"
  }
  
}

// MARK: - Unit Dependencies
extension AppConfig {
  
  func setupDependencies() {
    DIC.shared.register(type: BaseAPIService.self) { container in
      return ApiService()
    }
    
    DIC.shared.register(type: ListMemeService.self) { container in
      return ListMemeServiceImpl(container: container)
    }
  }
  
}
