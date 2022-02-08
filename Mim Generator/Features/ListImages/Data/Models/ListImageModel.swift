//
//  ListImageModel.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 08/02/22.
//

import Foundation

enum ListImage {
  
  enum FetchImages {
    struct Response {
      var images: [Meme]
    }
    
    struct ViewModel {
      struct DisplayMeme {
        var id: String
        var name: String
        var url: String
        var width: Int
        var height: Int
        var box_count: Int
      }
    }
  }
  
}
