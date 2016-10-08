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
    
    //Spotify Variables
    var SpotifyID:String!
    var SpotifyCallbackURL:String!
    var SpotifyTokenSwap:String!
    var SpotifyTokenRefresh:String!
    let spotifyAuthenticator = SPTAuth.defaultInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let configuration = Config()
        
        SpotifyID = configuration.SpotifyID
        SpotifyCallbackURL = configuration.SpotifyCallbackURL
        SpotifyTokenSwap = configuration.SpotifyTokenSwap
        SpotifyTokenRefresh = configuration.SpotifyTokenRefresh
        
    }
    
    
    @IBAction func onSpotifyButtonPress(_ sender: AnyObject) {
        spotifyAuthenticator?.clientID = SpotifyID
        spotifyAuthenticator?.requestedScopes = [SPTAuthStreamingScope]
        spotifyAuthenticator?.redirectURL = NSURL(string: SpotifyCallbackURL) as URL!
        spotifyAuthenticator?.tokenSwapURL = NSURL(string: SpotifyTokenSwap) as URL!
        spotifyAuthenticator?.tokenRefreshURL = NSURL(string: SpotifyTokenRefresh) as URL!
        
        
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
        let alert = UIAlertController(title: "Login Successful", message:
            "Successful Login!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func authenticationViewControllerDidCancelLogin(_ authenticationViewController: SPTAuthViewController!) {
        let alert = UIAlertController(title: "Login Cancelled", message:
            "Login Cancelled", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alert, animated: true, completion: nil)

    }
    
    func authenticationViewController(_ authenticationViewController: SPTAuthViewController!, didFailToLogin error: Error!) {
        let alert = UIAlertController(title: "Login Failed", message:
            "Login Failed!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }

    
    
}

