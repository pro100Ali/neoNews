//
//  ViewController.swift
//  neoNews
//
//  Created by Али  on 20.08.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy private var imageBack: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "Rectangle")
        return iv
    }()
    
    lazy private var label: UILabel = {
       let label = UILabel()
        label.text = "Добро пожаловать в NEWS APP"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 52, weight: .semibold)
        return label
    }()
    
    lazy private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Start to use", for: .normal)
        button.setTitleColor(UIColor(red: 0.3, green: 0.35, blue: 0.72, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = .white
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(navigateTo), for: .touchUpInside)
        return button
    }()
    
    lazy private var button2: UIButton = {
        let button = UIButton()
        button.setTitle("Есть профиль? Войти", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.insertSubview(imageBack, at: 0)
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(button2)
        setupConstraints()
    }
    
    @objc func navigateTo() {
        let vc = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func setupConstraints() {
            
        imageBack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(192)
        }
        
        button.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(label.snp.bottom).offset(32)
            make.height.equalTo(64)
        }
        
        button2.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(button.snp.bottom).offset(16)
        }
        
        
    }
}

