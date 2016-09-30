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
    
    func setupCell(){
    
        backgroundColor = .blue
        
    }
    
}
