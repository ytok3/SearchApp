//
//  SearchCollectionViewCell.swift
//  SearchApp
//
//  Created by Yasemin TOK on 18.03.2022.
//

import UIKit
import AlamofireImage

class SearchCollectionViewCell: UICollectionViewCell {
    
    // MARK: View
    
    private let searchImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.backgroundColor = .white
        return iv
    }()
    
    private let verticalStack: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        sv.axis = .vertical
        return sv
    }()
    
    private let artworkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = .black
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let collectionPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = .black
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let collectionNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = .black
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LifeCycle
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        contentView.frame = contentView.frame.inset(by: margins)
        contentView.layer.cornerRadius = 5
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.black.cgColor
        
        configureCells()
    }
    
    // MARK: Func
    
    func configureCells() {
        
        contentView.addSubview(searchImage)
        contentView.addSubview(verticalStack)
        verticalStack.addArrangedSubview(collectionPriceLabel)
        verticalStack.addArrangedSubview(collectionNameLabel)
        
        configureCellsConstraint()
    }
    
    func configureCellsConstraint() {
        
        let padding: CGFloat = 5
        
        NSLayoutConstraint.activate([
            
            searchImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            searchImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            searchImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            searchImage.heightAnchor.constraint(equalToConstant: contentView.frame.height / 1.25),
            searchImage.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2),
            
            verticalStack.topAnchor.constraint(equalTo: searchImage.bottomAnchor, constant: padding),
            verticalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            verticalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            verticalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            verticalStack.widthAnchor.constraint(equalToConstant: contentView.frame.width - padding * 2),
        
            collectionPriceLabel.topAnchor.constraint(equalTo: verticalStack.bottomAnchor),
            collectionPriceLabel.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),
            collectionPriceLabel.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor),
            
            collectionNameLabel.topAnchor.constraint(equalTo: collectionPriceLabel.bottomAnchor),
            collectionNameLabel.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),
            collectionNameLabel.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor),
            collectionNameLabel.bottomAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: -padding)
        ])
    }
    
    func showCharacters(model: Search) {

        searchImage.af.setImage(withURL: URL(string: (model.artworkUrl100!))!)
        collectionPriceLabel.text = "\(model.collectionPrice ?? 0)"
        collectionNameLabel.text = model.collectionName
    }
}
