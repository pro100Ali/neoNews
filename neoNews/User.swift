//
//  User.swift
//  neoNews
//
//  Created by Али  on 20.08.2023.
//

import Foundation

struct User: Codable {
    let email: String
    let first_name: String
}

struct ConfirmationUser: Codable {
    let message: String
    let user_id: String
    let refresh: String
    let access: String
}
