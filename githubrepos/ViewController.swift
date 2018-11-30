//
//  ViewController.swift
//  githubrepos
//
//  Created by Monsef Chakir on 29/11/2018.
//  Copyright © 2018 Aminerop. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

    var repo: GithubRepos?
    
    func setupNavBar(){
        title = "Trending Repos"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .mainColor
        navigationController?.navigationBar.backgroundColor = .mainColor
    
    }
    
    func setupCollectionView(){
        collectionView?.backgroundColor = .white
        collectionView?.register(RepoCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    func fetchRepos(){
        githubService.shared.getGithubRepos(onSuccess: { (repos: GithubRepos) in
            self.repo = repos
            self.collectionView?.reloadData()
        }) { (err) in
            print(err)
            let alert = UIAlertController(title: "Error", message: "Failed to get repos from api", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupNavBar()
        fetchRepos()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return repo?.items.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath as IndexPath) as! RepoCell
        cell.item = repo?.items[indexPath.item]
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

