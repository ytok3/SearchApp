//
//  ServiceManager.swift
//  SearchApp
//
//  Created by Yasemin TOK on 15.03.2022.
//

import Foundation
import Alamofire

final class ServiceManager {
    
    public static let shared: ServiceManager = ServiceManager()
}

extension ServiceManager {
    
    func fetch<T>(
        path: String,
        data: Codable?,
        method: HTTPMethod,
        onSuccess: @escaping (T) -> Void,
        onError: @escaping (AFError) -> Void
    )
    where T: Decodable, T: Encodable {
        
        AF.request(
            path,
            method: method,
            encoding: JSONEncoding.default
        ).validate().responseDecodable(of: T.self) { response in
            print(T.self)
            
            guard let model = response.value else {
                onError(response.error!)
                return
            }
            onSuccess(model)
        }
    }
}
