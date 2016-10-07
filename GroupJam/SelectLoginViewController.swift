//
//  SelectLoginViewController.swift
//  GroupJam
//
//  Created by Rohan Daruwala on 9/24/16.
//  Copyright © 2016 Rohan Daruwala. All rights reserved.
//

import UIKit

class SelectLoginViewController: UIViewController {
    @IBOutlet weak var spotifyButton: UIButton!
    @IBOutlet weak var AMButton: UIButton!
    
    //Variables for Spotify API
    let kClientID = "352c57b5aed84f8984ec1b6b9469a9ee"
    let kCallbackURL = "groupjam://callback"
    let kTokenSwapURL = "http://localhost:1234/swap"
    let kTokenRefreshURL = "http://localhost:1234/refresh"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //spotifyButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        //spotifyButton.setImage(UIImage(named: "spotify.png"), for: UIControlState.normal)
        
    }
    
    
    @IBAction func onSpotifyButtonPress(_ sender: AnyObject) {
    }
    
    @IBAction func onAMButtonPress(_ sender: AnyObject) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

