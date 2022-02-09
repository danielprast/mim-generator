//
//  MimePreviewVC.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 09/02/22.
//

import UIKit
import LBTATools

class MimePreviewVC: UIViewController {
  
  deinit {
    Logger.inspect(key: "VC \(MimePreviewVC.self)", value: "memory claimed")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .greyAja()
    
    if let navController = navigationController as? MimEditorNavigationController {
      Logger.inspect(key: "Mime Editor VC", value: "\(navController.mimEditor.meme?.id ?? "")")
      title = "MimGenerator"
    }
    
    
    view.addSubview(button)
    button.centerXToSuperview()
    button.centerYToSuperview()
    
    
  }
  
  lazy var button: UIButton = {
    let btn = UIButton(type: .system)
    btn.setTitle("Preview", for: .normal)
    btn.addTarget(self, action: #selector(showMimeSharePreview), for: .touchUpInside)
    return btn
  }()
  
  @objc private func showMimeSharePreview() {
    let destination = MimeShareVC()
    navigationController?.pushViewController(destination, animated: true)
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
