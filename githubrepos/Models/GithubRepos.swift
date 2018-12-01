//
//  GithubRepos.swift
//  githubrepos
//
//  Created by Monsef Chakir on 29/11/2018.
//  Copyright © 2018 Aminerop. All rights reserved.
//

import Foundation

struct GithubRepos: Decodable {
    let totalCount: Int?
    let incompleteResults: Bool?
    var items: [Item]?
    
    enum CodingKeys: String, CodingKey{
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}
