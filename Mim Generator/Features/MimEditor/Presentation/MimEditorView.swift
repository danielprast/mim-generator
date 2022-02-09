//
//  MimEditorView.swift
//  Mim Generator
//
//  Created by Daniel Prastiwa on 09/02/22.
//

import UIKit
import LBTATools
import SDWebImage

protocol MimEditorViewDelegate: AnyObject {
  func didTapAddLogo()
  func didTapAddText()
  func didTapNext()
}

class MimEditorView: UIView {
  
  @IBOutlet weak var imageView: UIImageView!
  
  lazy var addLogoView: AddLogoView = {
    let view = AddLogoView()
    view.setLabelText("Add Logo")
    return view
  }()

  lazy var addTextView: AddTextView = {
    let view = AddTextView()
    return view
  }()
  
  let bottomStack: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = 10
    return stack
  }()
  
  let commandButtonStackView: UIStackView = {
    let stack = UIStackView()
    stack.axis = .horizontal
    stack.distribution = .fill
    stack.spacing = 4
    return stack
  }()
  
  lazy var nextButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Berikutnya", for: .normal)
    button.backgroundColor = .mainBlue()

    button.layer.cornerRadius = 5
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    button.setTitleColor(.white, for: .normal)

    button.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
    
    return button
  }()
  
  weak var delegate: MimEditorViewDelegate?
  
  func setupGestures() {
    let addLogoTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapAddLogo))
    addLogoView.addGestureRecognizer(addLogoTapGesture)
    
    let addTextTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapAddText))
    addTextView.addGestureRecognizer(addTextTapGesture)
  }
  
  func displayLogo(_ image: UIImage?) {
    addLogoView.logoImageView.image = image
  }
  
  @objc private func didTapAddLogo() {
    delegate?.didTapAddLogo()
  }
  
  @objc private func didTapAddText() {
    delegate?.didTapAddText()    
  }
  
  func setupViews() {
    imageView.contentMode = .scaleAspectFit
    imageView.backgroundColor = .clear
    
    nextButton.withHeight(44)
    
    addLogoView.setupViews()
    addTextView.setupViews()
    
    //addLogoView.backgroundColor = .green
    addTextView.backgroundColor = .blue
    
    addLogoView.withSize(.init(width: 100, height: 96))
    addTextView.withSize(.init(width: 100, height: 96))
    
    commandButtonStackView.addArrangedSubview(addLogoView)
    commandButtonStackView.addArrangedSubview(addTextView)
    commandButtonStackView.addArrangedSubview(UIView())
    
    bottomStack.addArrangedSubview(commandButtonStackView)
    bottomStack.addArrangedSubview(nextButton)
    
    addSubview(bottomStack)
    
    imageView.anchor(
      .top(safeAreaLayoutGuide.topAnchor, constant: 10),
      .leading(leadingAnchor, constant: 10),
      .trailing(trailingAnchor, constant: 10)
    )
    
    bottomStack.anchor(
      .top(imageView.bottomAnchor, constant: 10),
      .leading(leadingAnchor, constant: 10),
      .trailing(trailingAnchor, constant: 10),
      .bottom(safeAreaLayoutGuide.bottomAnchor, constant: 10)
    )
  }

  func displayMeme(_ meme: Meme?) {
    if let meme = meme, let imageUrl = meme.url {
      imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
      imageView.sd_setImage(with: URL(string: imageUrl), completed: nil)
    } else {
      imageView.image = UIImage(named: "placeholderImage")
    }
  }
  
  @objc private func didTapNext() {
    delegate?.didTapNext()
  }
  
  static func loadViewFromNib() -> MimEditorView {
      let bundle = Bundle(for: self)
      let nib = UINib(nibName: "\(MimEditorView.self)", bundle: bundle)
      return nib.instantiate(withOwner: nil, options: nil).first as! MimEditorView
  }
  
}

class AddLogoView: UIView {
  
  let label: UILabel = {
    let lbl = UILabel()
    lbl.font = .systemFont(ofSize: 17)
    lbl.textAlignment = .center
    return lbl
  }()
  
  let logoImageView: UIImageView = {
    let imgView = UIImageView()
    imgView.contentMode = .scaleAspectFit
    imgView.clipsToBounds = true
    return imgView
  }()
  
  let stackView: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = 0
    return stack
  }()
  
  func setLabelText(_ text: String) {
    label.text = text
  }
  
  func setupViews() {
    addSubview(label)
    addSubview(logoImageView)
    
    label.anchor(
      .top(topAnchor, constant: 0),
      .leading(leadingAnchor, constant: 5),
      .trailing(trailingAnchor, constant: 5)
    )
    
    logoImageView.anchor(
      .top(label.bottomAnchor, constant: 5),
      .leading(leadingAnchor, constant: 5),
      .trailing(trailingAnchor, constant: 5),
      .bottom(bottomAnchor, constant: 5)
    )
    
    setPlaceHolderImage()
  }
  
  func setPlaceHolderImage() {
    logoImageView.image = UIImage(named: "placeholderImage")!
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

class AddTextView: UIView {
  
  let label: UILabel = {
    let lbl = UILabel()
    return lbl
  }()
  
  let inputText: UILabel = {
    let lbl = UILabel()
    return lbl
  }()
  
  func setupViews() {
    
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

//class MimEditorView: UIView {
//
//  lazy var imageView: UIImageView = {
//    let imgView = UIImageView()
//    imgView.contentMode = .scaleAspectFit
//    imgView.clipsToBounds = true
//    return imgView
//  }()
//
//  lazy var addLogoView: AddLogoView = {
//    let view = AddLogoView()
//    return view
//  }()
//
//  lazy var addTextView: AddTextView = {
//    let view = AddTextView()
//    return view
//  }()
//
//  lazy var nextButton: UIButton = {
//    let button = UIButton(type: .system)
//    button.setTitle("Berikutnya", for: .normal)
//    button.backgroundColor = .mainBlue()
//
//    button.layer.cornerRadius = 5
//    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//    button.setTitleColor(.white, for: .normal)
//
//    button.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
//
//    button.isEnabled = false
//    return button
//  }()
//
//  let bottomView = UIView()
//
//  let buttonCommandStackView: UIStackView = {
//    let stack = UIStackView()
//    stack.axis = .horizontal
//    stack.distribution = .fill
//    return stack
//  }()
//
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//
//    backgroundColor = .white
//
//    addSubview(imageView)
//    //addSubview(buttonCommandStackView)
//    //addSubview(nextButton)
//
//    let heightScale: CGFloat = self.bounds.size.height * 0.7
//    imageView.withHeight(heightScale)
//    imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
//    imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
//    imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10).isActive = true
//
//  }
//
//  @objc private func didTapNext() {
//
//  }
//
//  required init?(coder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//
//}

