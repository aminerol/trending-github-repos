//
//  ViewController.swift
//  githubrepos
//
//  Created by Monsef Chakir on 29/11/2018.
//  Copyright © 2018 Aminerop. All rights reserved.
//

import UIKit

class ReposViewController: UITableViewController {

    // array of repo items
    var repos = [Item]()
    
    // a pagenumber integer which will be incremente when reach bottom of the tableview
    var pageNumber: Int = 1
    
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
    func fetchRepos(page: Int){

        // substract 30 day from today date
        guard let date = Calendar.current.date(byAdding: .day, value: -30, to: Date()) else {return}

        // convert date to string to valide format for the api call
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let lastThirtyDays = dateFormatter.string(from: date)

        //call the getGithubRepos to get the list of repos fom api
        githubService.shared.getGithubRepos(date: lastThirtyDays, page: pageNumber, onSuccess: { (results: GithubRepos) in
            // in case the call was successfull append the items to our array of items
            
            // check if items not nil if so no more repos from api
            if let items = results.items {
                //increment page number after successfull api call
                self.pageNumber += 1
                
                //append array of items  with recieved items from api
                self.repos.append(contentsOf: items)
                
                //reload the tableview to render new cell with new items
                self.tableView?.reloadData()
            }
            
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
        fetchRepos(page: pageNumber)
    }

    //setting number of rows of the tableview
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // set the number of rows deponding of items count
        return repos.count
    }
    
    // creating the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //return a reusable uitableviewcell object of type Repo cell that is registred  for the tableview
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! RepoCell

        // set the repo item to the cell item
        cell.item = repos[indexPath.item]
        
        return cell
    }
    
    // the cell is about draw particular row
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // get last item index in the repos array
        let lastItem = repos.count - 1
        
        //check if this cell is last one in the tableview
        if  indexPath.row == lastItem {
            
            // call the fetchRepos with the incremented pagenumber
            fetchRepos(page: pageNumber)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

