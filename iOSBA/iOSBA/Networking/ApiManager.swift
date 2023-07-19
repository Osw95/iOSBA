//
//  ApiManager.swift
//  iOSBA
//
//  Created by Oswaldo Ferral on 18/07/23.
//

import UIKit

enum APIResult<T: Decodable> {
    case success(T)
    case failure(Error)
}

final class ApiManager {

    func load<T: Decodable>(resource: URL?, completion: @escaping (APIResult<T>) -> ()) {
        
        var task:URLSessionDataTask!
        
        if let task = task {
            task.cancel()
        }
        
        guard let url =  resource else { return }
        
        task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                do{
                    
                    let decoder = JSONDecoder()
                
                    let object = try decoder.decode(T.self, from: data)
                    
                    completion(.success(object))
                    
                }catch{
                    
                    completion(.failure(error))
                }
                
            }
            
        }
        
        task.resume()
    }
    
}
