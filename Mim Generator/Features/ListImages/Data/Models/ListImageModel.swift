//
//  ListImageModel.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 08/02/22.
//

import Foundation

enum ListImage {
  
  enum FetchImages {
    enum Response {
      
      struct Root: Codable {
        var data: Data?
      }
      
      struct Data: Codable {
        var memes: [Meme]
      }
      
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
