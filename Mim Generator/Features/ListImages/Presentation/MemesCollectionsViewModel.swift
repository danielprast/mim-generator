//
//  MemesCollectionsViewModel.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 08/02/22.
//

import Foundation

class MemesCollectionViewModel {
  
  private let getMemesUseCase: GetMemes
  
  init(getMemesUseCase: GetMemes) {
    self.getMemesUseCase = getMemesUseCase
  }
  
  weak var displayLogic: IMemesCollectionDisplayLogic?
  
  private(set) var displayedMemes: [Memes.ViewModel.DisplayMeme] = []
  
  func updateDisplayMemes(memes: [Meme]) {
    let mappedMemes = memes.map {
      Memes.ViewModel.DisplayMeme(meme: $0)
    }
    
    if !displayedMemes.isEmpty {
      displayedMemes.removeAll()
    }
    
    displayedMemes.append(contentsOf: mappedMemes)
    displayLogic?.displayMemes()
  }
  
  func getMemes() {
    getMemesUseCase.execute(param: GetMemesParam()) { [weak self] result in
      guard let self = self else { return }
      
      DispatchQueue.main.async {
        switch result {
        case .success(let memes):
          self.updateDisplayMemes(memes: memes)
        case .failure(let err):
          let message = err.localizedDescription
          self.displayLogic?.displayError(message: message)
        }
      }
    }
  }
  
}
