//
//  ApiCaller.swift
//  neoNews
//
//  Created by Али  on 20.08.2023.
//

import Foundation
import Alamofire


class APICaller {
    
    static let shared = APICaller()
    
    func signUp(email: String, name: String) {
        let urlString = "http://muha-backender.org.kg/register/"
        
        let user = User(email: email, first_name: name)
        
        AF.request(urlString, method: .post, parameters: user, encoder: JSONParameterEncoder.default, headers: ["Accept": "application/json", "Content-Type": "application/json"])
            .validate(statusCode: 200 ..< 600)
            .response { response in
                print(response.result)
                switch response.result {
                case .success(let data):
                    if let responseData = data {
                        debugPrint(String(data: responseData, encoding: .utf8))
                    }
                case .failure(let error):
                    print("Request failed. Error: \(error)")
                }
            }
    }
    
    func confirmCode(code: String, completion: @escaping (Result<ConfirmationUser, Error>) -> Void) {
        
        let urlString = "http://muha-backender.org.kg/confirm-code/"
        
        let parameters: [String: String] = [
            "code": code
        ]

        AF.request(urlString, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: ["Accept": "application/json", "Content-Type": "application/json"])
            .validate(statusCode: 200 ..< 600)
            .responseDecodable(of: ConfirmationUser.self) { response in
                print(response.debugDescription) // Print the response for debugging

                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func    setPassword(accesstoken: String, password: String, password2: String, completion: @escaping (Result<ConfirmationUser, Error>) -> Void) {
        
        let urlString = "http://muha-backender.org.kg/set-password/"
        
        let parameters: [String: String] = [
            "password1": password,
            "password2": password2
        ]
        let accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjkyNjA2NzAxLCJpYXQiOjE2OTI1MjAzMDEsImp0aSI6ImJlNzZiZTUyYTJkODRhOTZiYmY3MGE4ZTE0OWUxYjZjIiwidXNlcl9pZCI6NH0.xJ7Y9SZeulDrTglOIo8yZf0B0vDKG08aIs-a0RicuO0"
        
        
        AF.request(urlString, method: .put, parameters: parameters, encoder: JSONParameterEncoder.default, headers: ["Accept": "application/json", "Content-Type": "application/json", "Authorization": "Bearer \(accessToken)"])
            .validate(statusCode: 200 ..< 600)
            .responseDecodable(of: ConfirmationUser.self) { response in
                print(response.debugDescription)

                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }}



