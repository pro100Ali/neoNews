//
//  CustomButton.swift
//  neoNews
//
//  Created by Али  on 20.08.2023.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
      
        setup()
    
    }
    
    func setup() {
        
        setTitle("Sign in", for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        backgroundColor = UIColor(red: 0.3, green: 0.35, blue: 0.72, alpha: 1)
        layer.cornerRadius = 16
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
