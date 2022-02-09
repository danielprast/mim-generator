//
//  MimEditorVC.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 08/02/22.
//

import UIKit
import LBTATools
import Photos

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
  let imagePickerHandler = ImagePickerHandler()
  
  var mainView: MimEditorView {
    get { view as! MimEditorView }
  }
  
  private(set) var navController: MimEditorNavigationController?
  
  override func loadView() {
    view = MimEditorView.loadViewFromNib()
    mainView.delegate = self
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavBar()
    mainView.backgroundColor = .greyAja()
    mainView.setupViews()
    mainView.setupGestures()
    mainView.displayMeme(viewModel.mimEditor.meme)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    Logger.inspect(key: "VC", value: MimEditorVC.self)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navController?.updateMimEditorState(viewModel.mimEditor)
  }
  
  fileprivate func setupNavBar() {
    if let navController = navigationController as? MimEditorNavigationController {
      self.navController = navController
      
      viewModel.updateModel(self.navController!.mimEditor)
      
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
  
  @objc private func showMimePreview() {
    let destination = MimePreviewVC()
    navigationController?.pushViewController(destination, animated: true)
  }
  
}

// MARK: - MimEditorView Delegate
extension MimEditorVC: MimEditorViewDelegate {
  
  func didTapNext() {
    Logger.inspect(key: "next button", value: "joss")
  }
  
  fileprivate func pickImage() {
    imagePickerHandler.pickImage(self) { [unowned self] image in
      self.viewModel.updateLogo(image)
      self.mainView.displayLogo(image)
    }
  }
  
  func didTapAddLogo() {
    let photos = PHPhotoLibrary.authorizationStatus()
    
    switch photos {
    case .notDetermined:
      PHPhotoLibrary.requestAuthorization() { status in
        if status != .authorized {
          self.pickImage()
        } else {
          print("Rasidaa")
        }
      }
    case .restricted:
      break
    case .denied:
      break
    case .authorized:
      pickImage()
    case .limited:
      pickImage()
    @unknown default:
      Logger.inspect(key: "unkown", value: "...")
    }
  }
  
  func didTapAddText() {
    Logger.inspect(key: "Add Text", value: "TAP!!")
  }
  
}
