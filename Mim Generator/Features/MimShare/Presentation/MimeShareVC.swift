//
//  MimeShareVC.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 09/02/22.
//

import UIKit

class MimeShareVC: UIViewController {
  
  deinit {
    Logger.inspect(key: "VC \(MimeShareVC.self)", value: "memory claimed")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .greyAja()
    
    if let navController = navigationController as? MimEditorNavigationController {
      Logger.inspect(key: "Mime Editor VC", value: "\(navController.mimEditor.meme?.id ?? "")")
      title = "MimGenerator"
    }
    
    
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
