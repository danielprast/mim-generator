//
//  ListImageModel.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 08/02/22.
//

import Foundation

enum Memes {
  
  enum FetchMemes {
    
    enum Response {
      
      struct Root: Codable {
        var data: Data?
      }
      
      struct Data: Codable {
        var memes: [Meme]
      }
      
    }
  }
  
  struct ViewModel {
    struct DisplayMeme {
      var meme: Meme?
      
      var imageUrl: String {
        get {
          meme?.url ?? ""
        }
      }
    }
  }
  
}
