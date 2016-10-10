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
    
    var typeOfJam:String!
    
    var session:SPTSession?
    
    //Spotify Variables
    var SpotifyID:String!
    var SpotifyCallbackURL:String!
    var SpotifyTokenSwap:String!
    var SpotifyTokenRefresh:String!
    let spotifyAuthenticator = SPTAuth.defaultInstance()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let configuration = Config()
        typeOfJam = "";
        
        SpotifyID = configuration.SpotifyID
        SpotifyCallbackURL = configuration.SpotifyCallbackURL
        SpotifyTokenSwap = configuration.SpotifyTokenSwap
        SpotifyTokenRefresh = configuration.SpotifyTokenRefresh
        
        session = nil
        
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
        typeOfJam = "Spotify"
        self.session = session
        self.performSegue(withIdentifier: "jamSettings", sender: self)
    }
    @IBAction func onCloseButtonPress(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "jamSettings"){
            if(typeOfJam == "Spotify"){
                let destination = segue.destination as! SetupJamViewController
                destination.typeofJam = "Spotify"
                if(session != nil){
                    destination.session = self.session
                }
            }
            else if(typeOfJam == "Apple Music"){
                let destination = segue.destination as! SetupJamViewController
                destination.typeofJam = "Apple Music"
            }
            else{
                //ERROR!
            }
        }
    }

    
    
}

