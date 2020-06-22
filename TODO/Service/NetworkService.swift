//
//  NetworkService.swift
//  TODO
//
//  Created by Алексей Шумейко on 23.06.2020.
//  Copyright © 2020 Алексей Шумейко. All rights reserved.
//

import Foundation
struct NetworkService {
    static let shared = NetworkService()
    
    let URL_BASE = "http://localhost:3003"
    let URL_ADD_TODO = "/add"
    
    let session = URLSession(configuration: .default)
    
    func getTodos() {
        let url = URL(string: "\(URL_BASE)")!
        
        let task = session.dataTask(with: url) {
            (data, responce, error) in
            if let error = error {
                debugPrint(error.localizedDescription)
                return
            }
            
            guard let data = data, let responce = responce as? HTTPURLResponse else {
                debugPrint("Invalid data or responce")
                return
            }
            do {
                if responce.statusCode == 200 {
                    let items = try JSONDecoder().decode(Todos.self, from: data)
                    print(items)
                } else {
                    let err = try JSONDecoder().decode(APIError.self, from: data)
                }
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func addTodo(todo: Todo) {
        
    }
}
