//
//  ViewController.swift
//  SearchApp
//
//  Created by Yasemin TOK on 15.03.2022.
//

import UIKit

final class SearchViewController: UIViewController {
    
    private var searchViewModel: SearchViewModel = SearchViewModel(service: Services())
    private var searchCollectionViewFeatures: SearchCollectionViewFeatures = SearchCollectionViewFeatures()
    private var detailVC: SearchDetailViewController = SearchDetailViewController()
    var data: String = ""
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = Constant.Properties.SEARCH
        searchBar.sizeToFit()
        return searchBar
    }()
    
    private let horizontalStack: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        sv.axis = .horizontal
        return sv
    }()
    
    private var moviesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setTitle(Constant.Properties.MOVIES, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray5
        return button
    }()
    
    private var musicButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setTitle(Constant.Properties.MUSIC, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        button.backgroundColor = .systemGray5
        return button
    }()
    
    private var appsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setTitle(Constant.Properties.APPS, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray5
        return button
    }()
    
    private var booksButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setTitle(Constant.Properties.BOOKS, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray5
        return button
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: Constant.Cell.CELL)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = searchCollectionViewFeatures
        collectionView.dataSource = searchCollectionViewFeatures
        
        searchCollectionViewFeatures.delegate = self
        searchBar.delegate = self
        
        setUpView()
        
    }
    
    func setUpView() {
        
        view.backgroundColor = .white
        view.addSubview(searchBar)
        view.addSubview(horizontalStack)
        view.addSubview(collectionView)
        horizontalStack.addArrangedSubview(moviesButton)
        horizontalStack.addArrangedSubview(musicButton)
        horizontalStack.addArrangedSubview(appsButton)
        horizontalStack.addArrangedSubview(booksButton)

        setUpConstraint()
    }
    
    private func setUpConstraint() {
        
        let padding: CGFloat = 4
        
        NSLayoutConstraint.activate([
        
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            horizontalStack.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: padding),
            horizontalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            horizontalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            horizontalStack.widthAnchor.constraint(equalToConstant: view.frame.width - padding * 2),
            
            moviesButton.topAnchor.constraint(equalTo: horizontalStack.topAnchor),
    
            musicButton.topAnchor.constraint(equalTo: horizontalStack.topAnchor),
            musicButton.leftAnchor.constraint(equalTo: moviesButton.rightAnchor),
            
            appsButton.topAnchor.constraint(equalTo: horizontalStack.topAnchor),
            appsButton.leftAnchor.constraint(equalTo: musicButton.rightAnchor),
            
            booksButton.topAnchor.constraint(equalTo: horizontalStack.topAnchor),
            booksButton.leftAnchor.constraint(equalTo: appsButton.rightAnchor),
            
            collectionView.topAnchor.constraint(equalTo: horizontalStack.bottomAnchor, constant: padding),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding)
    
        ])
    }
    
    @objc func pressed() {
        
        self.searchCollectionViewFeatures.search.removeAll()
        searchViewModel.searchMusicVideos(inputMusic: data)
        collectionView.reloadData()
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.endEditing(true)
        
        let trimmedSearch = searchBar.text!.replacingOccurrences(of: " ", with: "")
        let input = trimmedSearch.lowercased()
        
        data = input
        
        print(input)
           
        searchViewModel.setDelegateSearchAll(output: self)
        searchViewModel.searchAllResults(inputSearch: input)
        
    }
}

extension SearchViewController: SearchBarOutput  {
    
    func getHeight() -> CGFloat {
        return view.bounds.height
    }
    
    func onSelected(ID: Int) {
        print(ID)
        searchViewModel.searchDetail(id: ID)
        searchViewModel.setDelegateDetail(output: detailVC)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func listSearchResults(values: [Search]) {
        searchCollectionViewFeatures.search = values
        collectionView.reloadData()
    }
    
    func listMusicVideos(values: [Search]) {
        searchCollectionViewFeatures.search = values
        collectionView.reloadData()
    }
}


