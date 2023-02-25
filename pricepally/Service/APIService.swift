//
//  APIService.swift
//  pricepally
//
//  Created by Suleiman Abubakar on 25/02/2023.
//

import Foundation
import Alamofire

protocol APIServiceProtocol {
    func getProducts(completion: @escaping (ProductResponse?, Error?) -> Void )
}

class APIService: APIServiceProtocol {
    
    func getProducts(completion: @escaping (ProductResponse?, Error?) -> Void) {
        guard let url = URL(string: "https://dev.pricepally.com/api/GetFilterProducts") else {
            completion(nil, nil)
            return
        }
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer YOUR_AUTH_TOKEN",
            "Accept": "application/json",
            "Content-Type": "application/json",
            "region": "LG"
        ]

        let parameters: [String: Any] = [
            "cat_id": [18],
            "sub_cat_id": [],
            "offset": "0",
            "user_id": "",
            "sort_by": "0"
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: ProductResponse.self) { response in
            switch response.result {
            case .success(let value):
                completion(value, nil)
            case .failure(let error):
                completion(nil, error)
                print("Error: \(error)")
            }
        }
    }

}

