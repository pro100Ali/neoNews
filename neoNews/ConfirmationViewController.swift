//
//  ConfirmationViewController.swift
//  neoNews
//
//  Created by Али  on 20.08.2023.
//

import UIKit
import SnapKit

class ConfirmationViewController: UIViewController, UITextFieldDelegate {

    var user: ConfirmationUser?
    
    var viewModel = LoginViewModel()
    
    lazy private var confirmField: UITextField = {
       let tx = UITextField()
        tx.placeholder = "Confirmation"
        return tx
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(confirmField)
        setupConstraints()
        confirmField.delegate = self

    }

    
    @objc func navigateToSetPassword(){
        APICaller.shared.confirmCode(code: confirmField.text!) { res in
            switch res {
            case .success(let data):
                self.user = data
                self.viewModel.configureToken(accessToken: self.user!.access)
                let vc = SetPasswordVC()
                
                self.navigationController?.pushViewController(vc, animated: true)
                
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    func setupConstraints() {
        confirmField.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder() // Hide the keyboard
           navigateToSetPassword() // Call your custom action method
           return true
       }
    
}
