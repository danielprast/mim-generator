//
//  MimEditorNavigationController.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 08/02/22.
//

import UIKit

class MimEditorNavigationController: UINavigationController {
  
  private(set) var mimEditor = MimEditor()
  
  func updateMeme(meme: Meme) {
    mimEditor.meme = meme
  }
  
  deinit {
    Logger.inspect(key: "VC \(MimEditorNavigationController.self)", value: "memory claimed")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
  }
}
