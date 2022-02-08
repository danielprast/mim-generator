//
//  MemesCell.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 08/02/22.
//

import UIKit
import SDWebImage

class MemesCell: UICollectionViewCell {
  static let cellID = String(describing: MemesCell.self)
  
  var model: Memes.ViewModel.DisplayMeme? {
    didSet {
      guard let m = model else { return }
      cellContentView.setIndicatorView()
      cellContentView.fetchImage(with: m.url)
    }
  }
  
  lazy var cellContentView: MemesTileView = {
    let view = MemesTileView()
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate func setupViews() {
    addSubview(cellContentView)
    cellContentView.anchor(
      top: topAnchor,
      left: leftAnchor,
      bottom: bottomAnchor,
      right: rightAnchor,
      paddingTop: 0,
      paddingLeft: 0,
      paddingBottom: 0,
      paddingRight: 0,
      width: 0,
      height: 0
    )
  }
  
}
