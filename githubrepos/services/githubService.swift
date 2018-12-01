//
//  githubService.swift
//  githubrepos
//
//  Created by Monsef Chakir on 29/11/2018.
//  Copyright © 2018 Aminerop. All rights reserved.
//

import Foundation
import UIKit

class githubService {
    
    //main api endoint
    let baseAPIEndppint = "https://api.github.com"
    
    //an instance to get funcs of our service
    static let shared = githubService()
    
    //
    func getGithubRepos(onSuccess: @escaping(GithubRepos) -> Void, onFailure: @escaping(Error) -> Void) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = Calendar.current.date(byAdding: .day, value: -30, to: Date()) else {return}
        let lastThirtyDays = dateFormatter.string(from: date)
        
        guard let url = URL(string: "\(baseAPIEndppint)/search/repositories?q=created:%3E\(lastThirtyDays)&sort=stars&order=desc") else { return }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, _, err) in
            DispatchQueue.main.async {
                if let err = err {
                    onFailure(err)
                    return
                }
                
                guard let data = data else { return }

                do {
                    let decoder = JSONDecoder()
                    let repos = try decoder.decode(GithubRepos.self, from: data)
                    onSuccess(repos)
                } catch let jsonErr {
                    onFailure(jsonErr)
                }
            }
        }).resume()
    }
}
