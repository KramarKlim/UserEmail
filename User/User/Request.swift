//
//  Request.swift
//  User
//
//  Created by Клим on 12.06.2021.
//

import Foundation
class Request {
    
    static var shared = Request()
    
    private init() {}
    
    var json = JSON()
    
    func fetchData(completion: @escaping ([User]) -> Void)  {
        
        guard let url = URL(string: self.json.userJson) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error { print(error); return }
                if let response = response { print(response)}
                guard let data = data else { return }
                let decoder = JSONDecoder()
                do {
                    let users = try decoder.decode([User].self, from: data)
                    completion(users)
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
}


