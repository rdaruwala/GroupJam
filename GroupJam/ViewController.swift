//
//  ViewController.swift
//  GroupJam
//
//  Created by Rohan Daruwala on 9/24/16.
//  Copyright © 2016 Rohan Daruwala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hostJamButton: UIButton!
    @IBOutlet weak var joinJamButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func onHostJamButtonPress(_ sender: AnyObject) {
        
    }

    @IBAction func onJoinJamButtonPress(_ sender: AnyObject) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

