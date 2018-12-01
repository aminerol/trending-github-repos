//
//  ViewController.swift
//  githubrepos
//
//  Created by Monsef Chakir on 29/11/2018.
//  Copyright © 2018 Aminerop. All rights reserved.
//

import UIKit

class ReposViewController: UITableViewController {

    // githubrepo object that holds repos
    var repo: GithubRepos?
    
    // func to customize the navigationbar
    func setupNavBar(){
        navigationItem.title = "Trending Repos"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .mainColor
        navigationController?.navigationBar.backgroundColor = .mainColor
    
    }
    
    // func to costumize the tableview
    func setupTableView(){
        tableView?.backgroundColor = .white
        tableView?.register(RepoCell.self, forCellReuseIdentifier: "cellId")
        tableView?.isPagingEnabled = true
    }
    
    // the func where we consuume our githubService
    func fetchRepos(){

        // substract 30 day from today date
        guard let date = Calendar.current.date(byAdding: .day, value: -30, to: Date()) else {return}

        // convert date to string to valide format for the api call
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let lastThirtyDays = dateFormatter.string(from: date)

        //call the getGithubRepos to get the list of repos fom api
        githubService.shared.getGithubRepos(lastThirtyDays, onSuccess: { (repos: GithubRepos) in
            // in case the call was successfull asign the list returned to githubrepo object
            self.repo = repos
            self.tableView?.reloadData()
        }, onFailure: { (err) in
            // in case any error print it also show to the user that there was an error
            // we could use a better logging
            print(err)
            let alert = UIAlertController(title: "Error", message: "Failed to get repos from api", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // call the funcs to build the ui
        setupTableView()
        setupNavBar()
        fetchRepos()
    }

    // override constructor for setting number of rows od the tableview
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // set the number of rows deponding of items count inside the githubrepo object else if githubrepo object is nil return 0
        return repo?.items.count ?? 0
    }
    
    // override constructor for for creating the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //return a reusable uitableviewcell object of type Repo cell that is registred  for the tableview
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! RepoCell

        // set the repo item to the cell item
        cell.item = repo?.items[indexPath.item]
        
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

