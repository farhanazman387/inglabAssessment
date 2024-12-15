//
//  NetworkService.swift
//  inglab assessment
//
//  Created by Farhana Azman on 15/12/2024.
//

import Alamofire

protocol NetworkServiceProtocol{
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol{
    func fetchUsers(completion: @escaping (Result<[User], any Error>) -> Void) {
        let url = "https://nextjs-boilerplate-ten-olive-60.vercel.app/api/users"
        
        AF.request(url).responseDecodable(of: [User].self) {response in
            if let error = response.error{
                completion(.failure(error))
            }else{
                completion(.success(response.value ?? []))
            }
        }
    }
}
