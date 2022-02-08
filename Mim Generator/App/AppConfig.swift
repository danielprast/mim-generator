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
      //PreviewController()
      UINavigationController(
        rootViewController: MemesCollectionVC(
          collectionViewLayout: UICollectionViewFlowLayout()
        )
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
  
  func setupDependencies(dic: DICProtocol) {
    dic.register(type: BaseAPIService.self) { container in
      return ApiService()
    }
    
    // MARK: List Meme
    dic.register(type: ListMemeService.self) { container in
      return ListMemeServiceImpl(container: container)
    }
    
    dic.register(type: ListMemeRepository.self) { container in
      return ListMemeRepositoryImpl(container: container)
    }
  }
  
}

// MARK: - Preview Controller

class PreviewController: UIViewController {
  let tileView: MemesTileView = {
    let view = MemesTileView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    view.addSubview(tileView)
    
    let width: CGFloat = (view.bounds.size.width / 3) - 6
    
    tileView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    tileView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    tileView.withWidth(width)
    tileView.withHeight(width)
    
  }
}
