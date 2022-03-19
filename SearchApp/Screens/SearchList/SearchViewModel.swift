//
//  SearchViewModel.swift
//  SearchApp
//
//  Created by Yasemin TOK on 17.03.2022.
//

import Foundation

protocol SearchViewModelProtocol {
    
    func setDelegateSearchAll(output: SearchBarOutput)
    func searchAllResults(inputSearch: String)
    
}

final class SearchViewModel: SearchViewModelProtocol {
    
    
    private var service: ServiceProtocol
    private var searchAll: [Search]?
    private var searchOutput: SearchBarOutput?
    
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    
    func setDelegateSearchAll(output: SearchBarOutput) {
        searchOutput = output
    }
    
    func searchAllResults(inputSearch: String) {
        service.getSearch(input: inputSearch) { [weak self] (response) in
            self?.searchAll = response
            self?.searchOutput?.listSearchResults(values: self?.searchAll ?? [])
            print(self?.searchAll ?? [])
        } onError: { error in
            print(error)
        }

    }
    
}
