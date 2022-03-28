//
//  Services.swift
//  SearchApp
//
//  Created by Yasemin TOK on 15.03.2022.
//

import Foundation
import Alamofire

protocol ServiceProtocol {
    
    func getSearch(input: String, onSuccess: @escaping ([Search]?) -> Void, onError: @escaping (AFError) -> Void)
    func getMusicVideos(input: String, onSuccess: @escaping ([Search]?) -> Void, onError: @escaping (AFError) -> Void)
    func getDetail(id: Int, onSucces: @escaping (Detail?) -> Void, onError: @escaping (AFError) -> Void)
}

final class Services: ServiceProtocol {
    
    // MARK: Func
    
    func getSearch(input: String, onSuccess: @escaping ([Search]?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: Constant.Network.BASE_URL + "\(input)" + Constant.Firebase.LIMIT, data: nil, method: HTTPMethod.get) { (response: SearchList) in
            onSuccess(response.results)
            print(response)
        } onError: { error in
            onError(error)
            print(error)
        }
    }
    
    func getMusicVideos(input: String, onSuccess: @escaping ([Search]?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: Constant.Network.BASE_URL + "\(input)" + Constant.Firebase.MUSIC_VIDEO, data: nil, method: HTTPMethod.get) { (response: SearchList) in
            onSuccess(response.results)
            print(response)
        } onError: { error in
            onError(error)
            print(error)
        }
    }
    
    func getDetail(id: Int, onSucces: @escaping (Detail?) -> Void, onError: @escaping (AFError) -> Void) {
        ServiceManager.shared.fetch(path: Constant.Network.ID_BASE_URL + "\(id)", data: nil, method: HTTPMethod.get) { (response: SearchDetail) in
            onSucces(response.results?.first)
            print(response)
        } onError: { error in
            onError(error)
            print(error)
        }
    }
}
