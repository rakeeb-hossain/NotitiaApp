//
//  ViewController.swift
//  Prototype
//
//  Created by Rakeeb on 2018-07-30.
//  Copyright © 2018 Rakeeb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        registerButton.layer.cornerRadius = 10
        registerButton.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

