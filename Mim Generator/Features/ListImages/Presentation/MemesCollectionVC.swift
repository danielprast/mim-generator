//
//  MemesCollection.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 08/02/22.
//

import UIKit

protocol IMemesCollectionDisplayLogic: AnyObject {
  func displayMemes()
  func displayError(message: String)
}

class MemesCollectionVCConfigurator {
  
  static func inject(viewController view: MemesCollectionVC) {
    let repository = DIC.shared.resolve(type: ListMemeRepository.self)!
    view.viewModel = MemesCollectionViewModel(
      getMemesUseCase: GetMemes(repository: repository)
    )
    view.viewModel.displayLogic = view
  }
  
}

class MemesCollectionVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  var viewModel: MemesCollectionViewModel!
  var refreshControl: UIRefreshControl!
  
  override init(collectionViewLayout layout: UICollectionViewLayout) {
    super.init(collectionViewLayout: layout)
    MemesCollectionVCConfigurator.inject(viewController: self)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.backgroundColor = .white
    collectionView.alwaysBounceVertical = true
    
    refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
    
    // Register cell classes
    self.collectionView!.register(MemesCell.self, forCellWithReuseIdentifier: MemesCell.cellID)
    collectionView.refreshControl = self.refreshControl
    
    title = "Meme Collection"
    
    viewModel.getMemes()
  }
  
  @objc fileprivate func onRefresh() {
    refreshControl.beginRefreshing()
    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) { [weak self] in
      guard let self = self else { return }
      self.viewModel.getMemes()
    }
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    Logger.inspect(key: "VC", value: "\(MemesCollectionVC.self)")
  }
  
  // MARK: Flow Delegate
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (view.frame.width - 2) / 3
    return CGSize(width: width, height: width)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
  
  // MARK: UICollectionViewDataSource
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of items
    return viewModel.displayedMemes.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemesCell.cellID, for: indexPath) as? MemesCell {
      cell.model = viewModel.displayedMemes[indexPath.item]
      cell.delegate = self
      return cell
    }
    
    return UICollectionViewCell()
  }
  
}

extension MemesCollectionVC: MemesCellDelegate {
  
  func didTapItem(meme: Meme) {
    showMimEditor(meme)
  }
  
}

extension MemesCollectionVC: IMemesCollectionDisplayLogic {
  
  func displayMemes() {
    refreshControl.endRefreshing()
    collectionView.reloadData()
  }
  
  func displayError(message: String) {
    
  }
  
}

// MARK: - Navigation
extension MemesCollectionVC {
  func showMimEditor(_ meme: Meme) {
    let detailController = MimEditorVC()
    let destination = MimEditorNavigationController(rootViewController: detailController)
    destination.modalPresentationStyle = .formSheet
    present(destination, animated: true, completion: nil)
  }
}
