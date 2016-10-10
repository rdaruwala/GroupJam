//
//  SetupJamViewController.swift
//  GroupJam
//
//  Created by Rohan Daruwala on 10/8/16.
//  Copyright © 2016 Rohan Daruwala. All rights reserved.
//

import UIKit
import Parse

class SetupJamViewController: UIViewController {

    
    @IBOutlet weak var jamNameTextField: UITextField!
    @IBOutlet weak var jamPassTextField: UITextField!
    @IBOutlet weak var LocationOption: UISwitch!
    @IBOutlet weak var ApproveOption: UISwitch!
    
    var isScreenUp:Bool!
    
    var typeofJam:String!
    
    var session:SPTSession!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(SetupJamViewController.keyboardWillShow(_:)), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(SetupJamViewController.keyboardWillHide(_:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
        
        
        isScreenUp = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onScreenTapAction(_ sender: AnyObject) {
        
        view.endEditing(true)
        
    }
    
    @IBAction func onCreateJamButtonPress(_ sender: AnyObject) {
        let newJam = PFObject(className: typeofJam)
        var pass = ""
        if(jamPassTextField.text != "" && jamPassTextField.text != nil){
            pass = jamPassTextField.text!
        }
        newJam.setObject(jamNameTextField.text!, forKey: "name")
        newJam.setObject(pass, forKey: "password")
        newJam.setObject(LocationOption.isEnabled, forKey: "checkLocation")
        newJam.setObject(ApproveOption.isEnabled, forKey: "checkApprove")
        
        let songList:[Song] = []
        
        
        /*newJam.saveInBackground { (succeeded, error) -> Void in
            if succeeded {
                self.performSegue(withIdentifier: "startJam", sender: self)
            } else {
                let alert = UIAlertController(title: "Jam Creation Failed", message:
                    "Error Connecting to Database", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alert, animated: true, completion: nil)
            }
        
    }*/
        
        self.performSegue(withIdentifier: "startJam", sender: self)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "startJam"){
            let destination = segue.destination as! HostJamViewController
            destination.session = self.session
        }
    }
    
    /**
     Moves the screen when keyboard is opened and closed
     **/
    func keyboardWillShow(_ notification: NSNotification) {
        if(!isScreenUp){
            self.view.frame.origin.y -= 100
            isScreenUp = true
        }
    }
    func keyboardWillHide(_ notification: NSNotification) {
        if(isScreenUp == true){
        self.view.frame.origin.y += 100
        isScreenUp = false
        }
    }
    

}

