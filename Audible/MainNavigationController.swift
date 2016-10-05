//
//  MainNavigationController.swift
//  Audible
//
//  Created by Mikheil Gotiashvili on 10/5/16.
//  Copyright © 2016 mrGott. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        if isLoggedIn() {
            print("Logged In")
        }
        
        
        
    }

    fileprivate func isLoggedIn() -> Bool {
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
