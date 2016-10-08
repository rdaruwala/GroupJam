//
//  SetupJamViewController.swift
//  GroupJam
//
//  Created by Rohan Daruwala on 10/8/16.
//  Copyright © 2016 Rohan Daruwala. All rights reserved.
//

import UIKit

class SetupJamViewController: UIViewController {

    
    @IBOutlet weak var jamNameTextField: UITextField!
    @IBOutlet weak var jamPassTextField: UITextField!
    @IBOutlet weak var LocationOption: UISwitch!
    @IBOutlet weak var ApproveOption: UISwitch!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(SetupJamViewController.keyboardWillShow(_:)), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(SetupJamViewController.keyboardWillHide(_:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onScreenTapAction(_ sender: AnyObject) {
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    /**
     Moves the screen when keyboard is opened and closed
     **/
    func keyboardWillShow(_ notification: NSNotification) {
        self.view.frame.origin.y -= 100
    }
    func keyboardWillHide(_ notification: NSNotification) {
        self.view.frame.origin.y += 100
    }
    

}
