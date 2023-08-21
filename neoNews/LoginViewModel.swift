//
//  LoginViewMode.swift
//  neoNews
//
//  Created by Али  on 20.08.2023.
//

import Foundation

class LoginViewModel: NSObject {
    
    private var alamofireCaller: APICaller!

//    private(set) var empData : [User]! {
//           didSet {
//               self.bindViewModelToController()
//           }
//       }
    private(set) var accessToken = ""
    
    
//    var bindViewModelToController: (() -> ()) = {}
    
    override init() {
        super.init()
        self.alamofireCaller = APICaller()
        callFuncToGetEmpData()

    }

    func signUp(email: String, name: String) {
        self.alamofireCaller.signUp(email: email, name: name)
    }
    
    func confirmCode(code: String) {
        self.alamofireCaller.confirmCode(code: code) { res in
            switch res {
            case .success(let success):
                print(success)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func configureToken(accessToken: String) {
        self.accessToken = accessToken
    }
    
    func callFuncToGetEmpData() {
       
    }
    
    func setPassword(accesstoken: String, password: String, password2: String) {
        APICaller.shared.setPassword(accesstoken: accesstoken, password: password, password2: password2) { res in
            
            switch res {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
            
        }
    }
}
