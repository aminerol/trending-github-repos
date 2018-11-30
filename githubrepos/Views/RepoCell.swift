//
//  RepoCell.swift
//  githubrepos
//
//  Created by Monsef Chakir on 30/11/2018.
//  Copyright © 2018 Aminerop. All rights reserved.
//

import UIKit

class RepoCell: UICollectionViewCell {
    
    var item: Item? {
        didSet{
            if let name = item?.name {
                nameLabel.text = name
            }
            if let description = item?.description {
                descriptionLabel.text = description
            }
            if let starsCount = item?.stargazersCount {
                startsCountLabel.text = "★ \(starsCount)"
            }
            
            if let ownerName = item?.owner.login, let avatarURL = item?.owner.avatarURL{
                ownerNameLabel.text = ownerName
                
                guard let url = URL(string: avatarURL) else { return }
                avatarImageView.load(url: url, placeholder: UIImage())
            }
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let startsCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ownerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(startsCountLabel)
        addSubview(ownerNameLabel)
        addSubview(avatarImageView)
    }
}
