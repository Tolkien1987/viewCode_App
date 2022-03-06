//
//  SportCollectionViewCell.swift
//  viewCode_App
//
//  Created by Fabio Martinez on 06/03/22.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "SportCollectionViewCell"
    
    let sportCollectionViewCellScreen: SportCollectionViewCellScreen = SportCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.configConstraints()
    }
    
    public func setupCell(data: Sport) {
        self.sportCollectionViewCellScreen.imageView.image = UIImage(named: data.nameImage)
        self.sportCollectionViewCellScreen.sportName.text = data.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        self.sportCollectionViewCellScreen.layer.borderWidth = 2.0
        self.sportCollectionViewCellScreen.layer.borderColor = UIColor.lightGray.cgColor
        self.sportCollectionViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.sportCollectionViewCellScreen)
    }
 
    func configConstraints() {
        NSLayoutConstraint.activate([
        
            self.sportCollectionViewCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.sportCollectionViewCellScreen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.sportCollectionViewCellScreen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.sportCollectionViewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        
        ])
    }
    
}
