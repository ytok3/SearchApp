//
//  SearchDetailViewController.swift
//  SearchApp
//
//  Created by Yasemin TOK on 19.03.2022.
//

import UIKit

protocol SearchDetailOutput {
    func listSearchDetail(model: Detail?)
}

class SearchDetailViewController: UIViewController {
    
    // MARK: View
    
    private let verticalStack: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        sv.axis = .vertical
        return sv
    }()
    
    private var artistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    private var primaryGenreNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
    }
    
    // MARK: Func
    
    func setUpView() {
        
        view.backgroundColor = .white
            
        view.addSubview(verticalStack)
        verticalStack.addArrangedSubview(artistNameLabel)
        verticalStack.addArrangedSubview(primaryGenreNameLabel)
    
        setUpConstraint()
    }

    func setUpConstraint() {
        
        let padding: CGFloat = 4
        
        NSLayoutConstraint.activate([
            
            verticalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            verticalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            verticalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            verticalStack.widthAnchor.constraint(equalToConstant: view.frame.width - padding * 2),
            verticalStack.heightAnchor.constraint(equalToConstant: view.frame.height / 10),
            
            artistNameLabel.topAnchor.constraint(equalTo: verticalStack.topAnchor),
            artistNameLabel.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),
            artistNameLabel.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor),
            
            primaryGenreNameLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor),
            primaryGenreNameLabel.leadingAnchor.constraint(equalTo: verticalStack.leadingAnchor),
            primaryGenreNameLabel.trailingAnchor.constraint(equalTo: verticalStack.trailingAnchor),
        ])
    }
}

// MARK: Extension

extension SearchDetailViewController: SearchDetailOutput {
    
    func listSearchDetail(model: Detail?) {
        artistNameLabel.text = model?.artistName
        primaryGenreNameLabel.text = model?.primaryGenreName
    }
}
