//
//  ViewController.swift
//  githubrepos
//
//  Created by Monsef Chakir on 29/11/2018.
//  Copyright © 2018 Aminerop. All rights reserved.
//

import UIKit

class ReposViewController: UITableViewController {

    var repo: GithubRepos?
    
    func setupNavBar(){
        navigationItem.title = "Trending Repos"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .mainColor
        navigationController?.navigationBar.backgroundColor = .mainColor
    
    }
    
    func setupTableView(){
        tableView?.backgroundColor = .white
        tableView?.register(RepoCell.self, forCellReuseIdentifier: "cellId")
        tableView?.isPagingEnabled = true
    }
    
    func fetchRepos(){
        githubService.shared.getGithubRepos(onSuccess: { (repos: GithubRepos) in
            self.repo = repos
            self.tableView?.reloadData()
        }, onFailure: { (err) in
            print(err)
            let alert = UIAlertController(title: "Error", message: "Failed to get repos from api", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupNavBar()
        fetchRepos()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repo?.items.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! RepoCell
        cell.item = repo?.items[indexPath.item]
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

