//
//  Item.swift
//  githubrepos
//
//  Created by Monsef Chakir on 29/11/2018.
//  Copyright © 2018 Aminerop. All rights reserved.
//

import Foundation

struct Item: Decodable {
    let id: Int
    let name: String
    let description: String
    let stargazersCount: Int
    let owner: Owner
    
    enum CodingKeys: String, CodingKey{
        case id, name, description
        case stargazersCount = "stargazers_count"
        case owner
    }
}
