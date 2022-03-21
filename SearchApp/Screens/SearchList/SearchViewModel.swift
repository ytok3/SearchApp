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
    func searchMusicVideos(inputMusic: String)
    func setDelegateDetail(output: SearchDetailOutput)
    func searchDetail(id: Int)
    
}

final class SearchViewModel: SearchViewModelProtocol {
    
    private var service: ServiceProtocol
    private var searchAll: [Search]?
    private var searchOutput: SearchBarOutput?
    private var music: [Search]?
    private var detailOutput: SearchDetailOutput?
    private var detail: Detail?
    
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    
    func setDelegateSearchAll(output: SearchBarOutput) {
        searchOutput = output
    }
    
    func setDelegateDetail(output: SearchDetailOutput) {
        detailOutput = output
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
    
    func searchMusicVideos(inputMusic: String) {
        service.getMusicVideos(input: inputMusic) { [weak self] (response) in
            self?.music = response
            self?.searchOutput?.listMusicVideos(values: self?.music ?? [])
        } onError: { error in
            print(error)
        }
    }
    
    func searchDetail(id: Int) {
        service.getDetail(id: id) { [weak self] (response) in
            self?.detail = response
            self?.detailOutput?.listSearchDetail(model: self?.detail)
        } onError: { error in
            print(error)
        }
    }
}
