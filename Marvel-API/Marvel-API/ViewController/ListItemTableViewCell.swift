//
//  ListItemTableViewCell.swift
//  Marvel-API
//
//  Created by Gabriel Ferreira on 25/08/20.
//  Copyright © 2020 Ribeiro Ferreira. All rights reserved.
//

import UIKit

class ListItemTableViewCell: UITableViewCell {
    var type: DataType?
    var item : Codable? {
        didSet {
            self.setData()
        }
    }
    
    var img: UIImage? {
        didSet {
            self.itemImage.image = self.img
            self.itemImage.backgroundColor = .clear
        }
    }
    
    private let container : UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let itemImage : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.backgroundColor = .darkGray
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private let padding: CGFloat = 8.0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(container)
        self.container.addSubview(self.nameLabel)
        self.container.addSubview(self.itemImage)
//                UIStackView(arrangedSubviews: [self.container, self.nameLabel])
        
        let containerLeadingAnchor = self.container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5)
        let containerTrailingAnchor = self.container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
        let containerTopAnchor = self.container.topAnchor.constraint(equalTo: self.topAnchor, constant: 5)
        let containerBottomAnchor = self.container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        let itemImageLeading = self.itemImage.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: self.padding)
        let itemImageBottom = self.itemImage.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -self.padding)
        let itemImageTop = self.itemImage.topAnchor.constraint(equalTo: self.container.topAnchor, constant: self.padding)
        let itemImageWidth = self.itemImage.widthAnchor.constraint(equalTo: self.itemImage.heightAnchor, multiplier: 1)
        let nameLabelLeading = self.nameLabel.leadingAnchor.constraint(equalTo: self.itemImage.trailingAnchor, constant: self.padding)
        let nameLabelTrailing = self.nameLabel.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: self.padding)
        let nameLabelCenterY = self.nameLabel.centerYAnchor.constraint(equalTo: self.container.centerYAnchor)
        
        let constraints = [
            containerLeadingAnchor,
            containerTrailingAnchor,
            containerTopAnchor,
            containerBottomAnchor,
            itemImageLeading,
            itemImageBottom,
            itemImageTop,
            itemImageWidth,
            nameLabelCenterY,
            nameLabelLeading,
            nameLabelTrailing
        ]

        NSLayoutConstraint.activate(constraints)
    
    }
     
     required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
     }
     
    func setData() {
        switch self.type {
        case .characters:
            let character = item as? Character
            self.nameLabel.text = character?.name
        case .comics:
            let comic = item as? Comic
            self.nameLabel.text = comic?.title
        case .stories:
            let story = item as? Story
            self.nameLabel.text = story?.title
        case .none:
            self.nameLabel.text = ""
        }
    }
}
    
