//
//  ViewController.swift
//  SearchApp
//
//  Created by Yasemin TOK on 15.03.2022.
//

import UIKit

protocol SearchBarOutput {
    
}

final class SearchViewController: UIViewController {
    
    private var searchViewModel: SearchViewModel = SearchViewModel(service: Services())
    
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = Constant.Properties.SEARCH
        searchBar.sizeToFit()
        return searchBar
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchBar.delegate = self
        setUpView()
    }
    
    func setUpView() {
        
        view.backgroundColor = .white
        view.addSubview(searchBar)
        
        setUpConstraint()
    }
    
    private func setUpConstraint() {
        
        let padding: CGFloat = 4
        
        NSLayoutConstraint.activate([
        
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    
        ])
    }


}

extension SearchViewController: UISearchBarDelegate {
    

    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.endEditing(true)
        
        let trimmedSearch = searchBar.text!.replacingOccurrences(of: " ", with: "")
        
        let input = trimmedSearch.lowercased()
        
        print(input)
            
        searchViewModel.searchAllResults(inputSearch: input)
            
    }
}


