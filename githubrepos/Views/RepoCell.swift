//
//  RepoCell.swift
//  githubrepos
//
//  Created by Monsef Chakir on 30/11/2018.
//  Copyright © 2018 Aminerop. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {
    
    //the item that holds repo info
    var item: Item? {
        didSet{
            if let name = item?.name {
                nameLabel.text = name
            }
            if let description = item?.description {
                descriptionLabel.text = description
            }
            if let starsCount = item?.stargazersCount {
                startsCountLabel.text = "★ \(starsCount.friendlyFormat)"
            }
            
            if let ownerName = item?.owner.login, let avatarURL = item?.owner.avatarURL{
                ownerNameLabel.text = ownerName
                
                guard let url = URL(string: avatarURL) else { return }
                avatarImageView.load(url: url, placeholder: UIImage())
            }
        }
    }
    
    // the main container as stackview where we add subviews vertically
    let container: UIStackView = {
        let view = UIStackView()
        view.distribution = .fill
        view.axis = .vertical
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //label that show the repo name
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //label that show the repo description
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //container where we add the owner repo info
    let bottomontainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //label that show the repo starts count
    let startsCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //we use stackView here to align the imageview next to owner name
    let ownerStackview: UIStackView = {
        let view = UIStackView()
        view.distribution = .fill
        view.axis = .horizontal
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //label that show the repo owner name
    let ownerNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //imageview that load the owner's avatr from the web
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // func to call after init where we add all the views to the contentView and positionate using constraints
    func setupViews() {
        
        //add main view to contentView
        addSubview(container)

        //set a margin(top-right-bottom-left) using constraint
        container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        container.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        
        // add nameLabel to stackView
        container.addArrangedSubview(nameLabel)

        // add descriptionLabel to stackView
        container.addArrangedSubview(descriptionLabel)

        // add owner info container to stackView
        container.addArrangedSubview(bottomontainer)
        
        // the stars count label the the owner info container
        bottomontainer.addSubview(startsCountLabel)

        //anchor the stars count label to bottom left of the owner info container
        startsCountLabel.topAnchor.constraint(equalTo: bottomontainer.topAnchor).isActive = true
        startsCountLabel.trailingAnchor.constraint(equalTo: bottomontainer.trailingAnchor).isActive = true
        startsCountLabel.bottomAnchor.constraint(equalTo: bottomontainer.bottomAnchor).isActive = true
        
        // add the owner stackView to owner bottom container
        bottomontainer.addSubview(ownerStackview)

        //anchor the the owner stackview to bottom right of the owner container
        ownerStackview.topAnchor.constraint(equalTo: bottomontainer.topAnchor).isActive = true
        ownerStackview.leadingAnchor.constraint(equalTo: bottomontainer.leadingAnchor).isActive = true
        ownerStackview.bottomAnchor.constraint(equalTo: bottomontainer.bottomAnchor).isActive = true
        
        //add the avatar imageview to owner stackview
        ownerStackview.addArrangedSubview(avatarImageView)

        //set the width and height of the imageview
        avatarImageView.widthAnchor.constraint(equalToConstant: 26).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        //add the ownername label to owner stackview
        ownerStackview.addArrangedSubview(ownerNameLabel)
    }
}
