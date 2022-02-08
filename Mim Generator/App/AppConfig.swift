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
}
