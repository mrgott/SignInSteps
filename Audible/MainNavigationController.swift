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
            let homeController = HomeViewController()
            viewControllers = [homeController]
        } else {
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        }
        
        
        
    }

    fileprivate func isLoggedIn() -> Bool {
        return false
    }
    
    func showLoginController(){
        let loginController = LoginController()
        present(loginController, animated: true) { 
            //something to be done here
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
