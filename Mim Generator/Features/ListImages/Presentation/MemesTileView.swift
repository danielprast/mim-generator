//
//  MemesTileView.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 08/02/22.
//

import UIKit
import SDWebImage

class MemesTileView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  let imageView: UIImageView = {
    let img = UIImageView(image: UIImage(named: "coffee")!)
    img.contentMode = .scaleAspectFill
    img.clipsToBounds = true
    img.layer.borderWidth = 0.5
    img.layer.borderColor = UIColor.mainBlue().cgColor
    return img
  }()
  
  fileprivate func setupViews() {
    
    backgroundColor = .clear
    
    addSubview(imageView)
    imageView.fillSuperview()
    
  }
  
  func setIndicatorView() {
    imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
  }
  
  func fetchImage(with url: String) {
    imageView.sd_setImage(with: URL(string: url))
  }
}
