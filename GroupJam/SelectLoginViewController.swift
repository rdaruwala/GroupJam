//
//  SelectLoginViewController.swift
//  GroupJam
//
//  Created by Rohan Daruwala on 9/24/16.
//  Copyright © 2016 Rohan Daruwala. All rights reserved.
//

import UIKit

class SelectLoginViewController: UIViewController, SPTAuthViewDelegate {
    @IBOutlet weak var spotifyButton: UIButton!
    @IBOutlet weak var AMButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //spotifyButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        //spotifyButton.setImage(UIImage(named: "spotify.png"), for: UIControlState.normal)
        
    }
    
    
    @IBAction func onSpotifyButtonPress(_ sender: AnyObject) {
        spotifyAuthenticator?.clientID = kClientID
        spotifyAuthenticator?.requestedScopes = [SPTAuthStreamingScope]
        spotifyAuthenticator?.redirectURL = NSURL(string: kCallbackURL) as URL!
        spotifyAuthenticator?.tokenSwapURL = NSURL(string: kTokenSwapURL) as URL!
        spotifyAuthenticator?.tokenRefreshURL = NSURL(string: kTokenRefreshURL) as URL!
        
      
        
        let spotifyAuthenticationViewController = SPTAuthViewController.authentication()
        spotifyAuthenticationViewController?.delegate = self
        spotifyAuthenticationViewController?.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        spotifyAuthenticationViewController?.definesPresentationContext = true
        present(spotifyAuthenticationViewController!, animated: false, completion: nil)
    }
    
    @IBAction func onAMButtonPress(_ sender: AnyObject) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func authenticationViewController(_ authenticationViewController: SPTAuthViewController!, didLoginWith session: SPTSession!) {
    }
    
    func authenticationViewControllerDidCancelLogin(_ authenticationViewController: SPTAuthViewController!) {

    }
    
    func authenticationViewController(_ authenticationViewController: SPTAuthViewController!, didFailToLogin error: Error!) {
        
    }

    
    
}

