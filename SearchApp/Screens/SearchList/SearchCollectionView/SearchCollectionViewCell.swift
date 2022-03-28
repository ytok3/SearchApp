//
//  SearchCollectionViewCell.swift
//  SearchApp
//
//  Created by Yasemin TOK on 18.03.2022.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    // MARK: View
    
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
        
        contentView.addSubview(verticalStack)
        verticalStack.addArrangedSubview(artworkLabel)
        verticalStack.addArrangedSubview(collectionPriceLabel)
        verticalStack.addArrangedSubview(collectionNameLabel)
        
        configureCellsConstraint()
    }
    
    func configureCellsConstraint() {
        
        let padding: CGFloat = 5
        
        NSLayoutConstraint.activate([
            
            verticalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            verticalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            verticalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            verticalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            verticalStack.widthAnchor.constraint(equalToConstant: contentView.frame.width - padding * 2),
            
            artworkLabel.topAnchor.constraint(equalTo: verticalStack.topAnchor),
            artworkLabel.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),
            artworkLabel.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor),
        
            collectionPriceLabel.topAnchor.constraint(equalTo: artworkLabel.bottomAnchor),
            collectionPriceLabel.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),
            collectionPriceLabel.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor),
            
            collectionNameLabel.topAnchor.constraint(equalTo: collectionPriceLabel.bottomAnchor),
            collectionNameLabel.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),
            collectionNameLabel.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor),
            collectionNameLabel.bottomAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: -padding)
        ])
    }
    
    func showCharacters(model: Search) {

        artworkLabel.text = model.artworkUrl100
        collectionPriceLabel.text = "\(model.collectionPrice ?? 0)"
        collectionNameLabel.text = model.collectionName
    }
}
