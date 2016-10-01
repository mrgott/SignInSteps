//
//  PageCellCollectionViewCell.swift
//  Audible
//
//  Created by Mikheil Gotiashvili on 9/30/16.
//  Copyright © 2016 mrGott. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let stepImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .green
        
        return imageView
    }()
    
    func setupCell(){
    
        backgroundColor = .green
        addSubview(stepImageView)
        stepImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stepImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stepImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stepImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
    }
    
}
