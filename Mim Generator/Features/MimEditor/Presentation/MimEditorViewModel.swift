//
//  MimEditorViewModel.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 09/02/22.
//

import Foundation

class MimEditorViewModel {
  
  private(set) var mimEditor: MimEditor?
  
  func updateModel(_ mimEditor: MimEditor?) {
    self.mimEditor = mimEditor
  }
  
}
