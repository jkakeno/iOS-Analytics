//
//  Client.swift
//  InspiringApp
//
//  Created by Jun Kakeno on 5/28/19.
//  Copyright © 2019 Jun Kakeno. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case noInternetConnection
    case requestFailed
    case responseUnsuccessful(statusCode: Int)
}

class Client {

    lazy var url: URL = {
        return  URL(string:"https://dev.inspiringapps.com/Files/IAChallenge/30E02AAA-B947-4D4B-8FB6-9C57C43872A9/Apache.log")!
    }()

    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    typealias CompletionHandler = (String?, Error?) -> Void
    
    func downloadData(completionHandler completion: @escaping CompletionHandler) {
        
        let task = session.dataTask(with: url) {data, response, error in
            DispatchQueue.main.async {
                
                guard let data = data else {
                    completion(nil, NetworkError.noInternetConnection)
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(nil, NetworkError.requestFailed)
                    return
                }
                if httpResponse.statusCode == 200 {
                    let contents = String(data: data, encoding: .utf8)
                    completion(contents, nil)
                } else {
                    completion(nil, NetworkError.responseUnsuccessful(statusCode: httpResponse.statusCode))
                }

            }
        }
        task.resume()
    }
}


























