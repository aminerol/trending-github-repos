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
    
    /**
        call the github api and get the most starred github repos of a given date
        - parameter date: match the repos the were created after this date
        - parameter onSuccess: Completion handler called after successfully fetched the api
        - parameter onFailure: Completion handler called whene error occured on fetching api or decoding the json
    */
    func getGithubRepos(date: String, page: Int, onSuccess: @escaping(GithubRepos) -> Void, onFailure: @escaping(Error) -> Void) {
        
        //Construct the URL object with date param and using guard to check if the url is valid
        guard let url = URL(string: "\(baseAPIEndppint)/search/repositories?q=created:%3E\(date)&sort=stars&order=desc&per_page=100&page=\(page)") else { return }
        
        // use URLSession to call the api with a task created to call it on background thread
        URLSession.shared.dataTask(with: url, completionHandler: { (data, _, err) in

            //push the next block to the main thread async to not freez the UI
            DispatchQueue.main.async {

                // check if theres no error during the api call if so call the onFailure to handle the error 
                if let err = err {
                    onFailure(err)
                    return
                }
                
                guard let data = data else { return }

                do {
                    //decode the returned json using the GithubRepos Decodable
                    let decoder = JSONDecoder()
                    let repos = try decoder.decode(GithubRepos.self, from: data)
                    
                    // call onSuccess to return the list of repos
                    onSuccess(repos)
                } catch let jsonErr {
                    //call the onFailure to handle the error
                    onFailure(jsonErr)
                }
            }
        }).resume()/*start the task created*/
    }
}
