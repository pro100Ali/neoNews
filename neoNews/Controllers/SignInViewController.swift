//
//  SignInViewController.swift
//  neoNews
//
//  Created by Али  on 22.08.2023.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController, UITextFieldDelegate {

    var viewModel = LoginViewModel()
    
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
        view.addSubview(button)
        view.addSubview(passwordField)
        view.addSubview(nameField)
        setupConstraints()
        button.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        nameField.autocapitalizationType = .sentences
    }
    

    @objc func signUp() {
        viewModel.signIn(email: nameField.text!, name: passwordField.text!)
        let vc = NewsVC()
        self.navigationController?.pushViewController(vc, animated: true)
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           // Allow only lowercase letters
           let allowedCharacters = CharacterSet.lowercaseLetters

           // Convert NSRange to Range<String.Index>
           if let text = textField.text,
               let textRange = Range(range, in: text) {

               let filteredString = string.filter { allowedCharacters.contains($0.unicodeScalars.first!) }

               // Ensure the first character is lowercase
               var modifiedString = filteredString
               if let firstChar = filteredString.first {
                   modifiedString = String(firstChar).lowercased() + String(filteredString.dropFirst())
               }

               textField.text?.replaceSubrange(textRange, with: modifiedString)
           }

           return false
       }
  

}
