//
//  FindJamViewController.swift
//  GroupJam
//
//  Created by Rohan Daruwala on 10/10/16.
//  Copyright © 2016 Rohan Daruwala. All rights reserved.
//

import UIKit
import MapKit
import Parse

class FindJamViewController: UIViewController, CLLocationManagerDelegate {
    
    

    @IBOutlet var jamMapView: MKMapView!
    
    @IBOutlet weak var jamTextField: UITextField!
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onJoinJamButtonPress(_ sender: AnyObject) {
        let input = jamTextField.text!
        if(input == ""){
            let alert = UIAlertController(title: "Textbox Empty", message:
                "Please input a Jam name", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alert, animated: true, completion: { 
                return
            })
        }
        else{
        let query = PFQuery(className: "Jam")
        query.whereKey("name", equalTo: input.lowercased())
        query.findObjectsInBackground { (objects, error) -> Void in
            if error == nil {
                let firstJam = objects?[0]
                if(firstJam == nil){
                    let alert = UIAlertController(title: "Could not find Jam", message:
                        "There is no active Jam with this name", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
                    
                    self.present(alert, animated: true, completion: {
                        return
                    })
                }
                else{
                    
                if(firstJam?.value(forKey: "password") as! String != ""){
                    let alert = UIAlertController(title: "Password Required", message: "Enter the password", preferredStyle: .alert)
                    alert.addTextField(configurationHandler: nil)
                    alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (_) in
                        let passText = alert.textFields?[0].text
                        if(passText != firstJam?.value(forKey: "password") as? String){
                            let alert = UIAlertController(title: "Incorrect Password", message:
                                "You have entered the incorrect password for this Jam", preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
                            
                            self.present(alert, animated: true, completion: {
                                return
                            })
                        }
                        else{
                            self.performSegue(withIdentifier: "intoJam", sender: self)
                        }
                        
                    }))

                }
                else{
                    self.performSegue(withIdentifier: "intoJam", sender: self)
                    }
                    
                }
            
            } else {
                let alert = UIAlertController(title: "Database Error", message:
                    "Could Not Connect to Database", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alert, animated: true, completion: {
                    return
                })
            }
    }
        }
        
    }
    
    @nonobjc func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let location = locations.last as! CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.jamMapView.setRegion(region, animated: true)
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
