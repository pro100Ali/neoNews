//
//  SetPasswordVC.swift
//  neoNews
//
//  Created by Али  on 21.08.2023.
//

import UIKit
import SnapKit

class SetPasswordVC: UIViewController, UITextFieldDelegate {

    let viewModel = LoginViewModel()
    
    lazy private var nameField: UITextField = {
       let tx = UITextField()
        tx.placeholder = "Почта"
        return tx
    }()
    
    
    lazy private var passwordField: UITextField = {
       let tx = UITextField()
        tx.placeholder = "Пароль"
        return tx
    }()
    
    let button = CustomButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(passwordField)
        view.addSubview(nameField)
        view.addSubview(button)
        setupConstraints()
        nameField.autocapitalizationType = .sentences
        button.addTarget(self, action: #selector(setPassword), for: .touchUpInside)
    }
    

    @objc func setPassword() {
        
        viewModel.setPassword(accesstoken: viewModel.accessToken ,password: nameField.text!, password2: nameField.text!)
        
        print("Finished")
    }
    
    func setupConstraints() {
        nameField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(128)
        }
        
        passwordField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(nameField.snp.bottom).offset(52)
        }
        
        button.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(passwordField.snp.bottom).offset(167)
            make.height.equalTo(64)
        }
    
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder() // Hide the keyboard
           setPassword() // Call your custom action method
           return true
       }
    

}
