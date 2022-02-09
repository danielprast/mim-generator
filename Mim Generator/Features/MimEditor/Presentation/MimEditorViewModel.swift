//
//  MimEditorViewModel.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 09/02/22.
//

import UIKit

class MimEditorViewModel {
  
  private(set) var mimEditor = MimEditor()
  
  func updateModel(_ mimEditor: MimEditor) {
    self.mimEditor = mimEditor
  }
  
  func updateLogo(_ image: UIImage?) {
    mimEditor.logo = image
  }
  
}
