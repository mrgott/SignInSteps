//
//  PageCellCollectionViewCell.swift
//  Audible
//
//  Created by Mikheil Gotiashvili on 9/30/16.
//  Copyright © 2016 mrGott. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: PageCellModel? {
        didSet {
            
            guard let page = page else {
                return
            }
            
            stepImageView.image = UIImage(named: page.imageName)
            
            let color = UIColor(white: 0.2, alpha: 1)
            let attributedString = NSMutableAttributedString(string: page.title, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 18, weight: UIFontWeightMedium), NSForegroundColorAttributeName: color])
            attributedString.append(NSAttributedString(string: "\n\n" + page.message, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: color]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let length = attributedString.string.characters.count
            attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0, length: length))
            
            textField.attributedText = attributedString
            
            
        }
    }
    
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
    
    let textField: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        textField.text = "Hello There"
        
       return textField
    }()
    
    let lineSeparator: UIView = {
        let lineSeparator = UIView()
        lineSeparator.backgroundColor = UIColor(white: 0.9, alpha: 1)
        lineSeparator.translatesAutoresizingMaskIntoConstraints = false
        
        return lineSeparator
    }()
    
    func setupCell(){
    
        addSubview(stepImageView)
        stepImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stepImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stepImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        stepImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true
        
        addSubview(textField)
        textField.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        textField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        textField.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        
        addSubview(lineSeparator)
        lineSeparator.bottomAnchor.constraint(equalTo: textField.topAnchor).isActive = true
        lineSeparator.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        lineSeparator.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        lineSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
}
