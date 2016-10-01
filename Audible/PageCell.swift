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
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "page1")
        
        return imageView
    }()
    
    let bottomView: UITextView = {
        let bottomView = UITextView()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = .white
        bottomView.text = "Hello There"
        
       return bottomView
    }()
    
    func setupCell(){
    
        backgroundColor = .green
        addSubview(stepImageView)
        stepImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stepImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stepImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        stepImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true
        
        addSubview(bottomView)
        bottomView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        bottomView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bottomView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
    }
    
}
