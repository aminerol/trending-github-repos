//
//  RepoCell.swift
//  githubrepos
//
//  Created by Monsef Chakir on 30/11/2018.
//  Copyright © 2018 Aminerop. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {
    
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
    
    let container: UIStackView = {
        let view = UIStackView()
        view.distribution = .fill
        view.axis = .vertical
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bottomontainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let startsCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ownerStackview: UIStackView = {
        let view = UIStackView()
        view.distribution = .fill
        view.axis = .horizontal
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let ownerNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
    
    
    
    func setupViews() {
        
        addSubview(container)
        container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        container.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        
        container.addArrangedSubview(nameLabel)
        container.addArrangedSubview(descriptionLabel)
        container.addArrangedSubview(bottomontainer)
        
        bottomontainer.addSubview(startsCountLabel)
        startsCountLabel.topAnchor.constraint(equalTo: bottomontainer.topAnchor).isActive = true
        startsCountLabel.trailingAnchor.constraint(equalTo: bottomontainer.trailingAnchor).isActive = true
        startsCountLabel.bottomAnchor.constraint(equalTo: bottomontainer.bottomAnchor).isActive = true
        
        bottomontainer.addSubview(ownerStackview)
        ownerStackview.topAnchor.constraint(equalTo: bottomontainer.topAnchor).isActive = true
        ownerStackview.leadingAnchor.constraint(equalTo: bottomontainer.leadingAnchor).isActive = true
        ownerStackview.bottomAnchor.constraint(equalTo: bottomontainer.bottomAnchor).isActive = true
        
        ownerStackview.addArrangedSubview(avatarImageView)
        avatarImageView.widthAnchor.constraint(equalToConstant: 26).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 26).isActive = true
        
        ownerStackview.addArrangedSubview(ownerNameLabel)
    }
}
