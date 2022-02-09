//
//  MimEditorVC.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 08/02/22.
//

import UIKit
import LBTATools

class MimEditorVC: UIViewController {
  
  deinit {
    Logger.inspect(key: "VC \(MimEditorVC.self)", value: "memory claimed")
  }
  
  var mimeEditorState: MimEditor {
    get {
      (navigationController as! MimEditorNavigationController).mimEditor
    }
  }
  
  var viewModel = MimEditorViewModel()
  
  var mainView: MimEditorView {
    get { view as! MimEditorView }
  }
  
  override func loadView() {
    view = MimEditorView.loadViewFromNib()
    mainView.delegate = self
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mainView.backgroundColor = .greyAja()
    mainView.setupViews()
    mainView.setupGestures()
    
    if let _ = navigationController as? MimEditorNavigationController {
      
      let leftBarButton = UIBarButtonItem(
        title: "Close",
        style: .plain,
        target: self,
        action: #selector(didTapClose)
      )
      
      navigationItem.leftBarButtonItem = leftBarButton
      title = "MimGenerator"
    }
  }
                                          
  @objc private func didTapClose() {
    navigationController?.dismiss(animated: true, completion: nil)
  }
                                          
  
  lazy var button: UIButton = {
    let btn = UIButton(type: .system)
    btn.setTitle("Preview", for: .normal)
    btn.addTarget(self, action: #selector(showMimePreview), for: .touchUpInside)
    return btn
  }()
  
  @objc private func showMimePreview() {
    let destination = MimePreviewVC()
    navigationController?.pushViewController(destination, animated: true)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    Logger.inspect(key: "VC", value: MimEditorVC.self)
  }
}

extension MimEditorVC: MimEditorViewDelegate {
  
  func didTapAddLogo() {
    Logger.inspect(key: "Add logo", value: "TAP!!")
  }
  
  func didTapAddText() {
    Logger.inspect(key: "Add Text", value: "TAP!!")
  }
  
}
