//
//  HostJamViewController.swift
//  GroupJam
//
//  Created by Rohan Daruwala on 10/9/16.
//  Copyright © 2016 Rohan Daruwala. All rights reserved.
//

import UIKit

class HostJamViewController: UIViewController, SPTAudioStreamingPlaybackDelegate {
    
    var player: SPTAudioStreamingController?
    let configuration = Config()
    

    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupSpotifyPlayer() {
        player = SPTAudioStreamingController.sharedInstance()
        do{
            try
            player?.start(withClientId: configuration.SpotifyID)
        }
        catch {
            let alert = UIAlertController(title: "Jam Start Failed", message:
                "Error Connecting to Database", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alert, animated: true, completion: { 
                self.dismiss(animated: true, completion: nil)
            })

        }
        player!.playbackDelegate = self
        player!.diskCache = SPTDiskCache(capacity: 1024 * 1024 * 64)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
