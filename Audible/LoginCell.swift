//
//  LoginCell.swift
//  Audible
//
//  Created by Mikheil Gotiashvili on 10/2/16.
//  Copyright © 2016 mrGott. All rights reserved.
//

import UIKit

class LoginCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLoginCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLoginCell(){
    
        backgroundColor = .white
    
    }
    
}
