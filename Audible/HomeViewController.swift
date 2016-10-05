//
//  HomeViewController.swift
//  Audible
//
//  Created by Mikheil Gotiashvili on 10/5/16.
//  Copyright © 2016 mrGott. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Welcome"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sing Out", style: .plain, target: self, action: #selector(handleSignOut))
        navigationItem.leftBarButtonItem?.tintColor = .orange
        
        view.backgroundColor = .white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleSignOut(){
        
        UserDefaults.standard.setIsLoggedIn(value: false)
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
        
    }

}
