//
//  News.swift
//  neoNews
//
//  Created by Али  on 24.08.2023.
//

import Foundation

struct News: Codable {
    
    let id: Int?
    let title: String?
    let content: String?
    let image: String?
    let created_date: String?
    let category: String?
}
