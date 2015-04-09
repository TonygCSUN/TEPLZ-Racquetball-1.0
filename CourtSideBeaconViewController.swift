//
//  CourtSideBeaconViewController.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 3/30/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//

import UIKit

class CourtSideBeaconViewController: UIViewController {

    
    
    @IBAction func checkIn(sender: AnyObject) {
        
        PFUser.currentUser().setObject(true, forKey: "activePlayer")
        
        PFUser.currentUser().saveInBackgroundWithBlock {
            (success: Bool!, error: NSError!) -> Void in
            
            if (success != nil) {
                println("Object modified")
                
            } else {
                println("Error: \(error)")
            }
        }
    }
    
    
    @IBAction func checkOut(sender: AnyObject) {
        
        PFUser.currentUser().setObject(false, forKey: "activePlayer")
        
        PFUser.currentUser().saveInBackgroundWithBlock {
            (success: Bool!, error: NSError!) -> Void in
            
            if (success != nil) {
                println("Object created")
                
            } else {
                println("Error: \(error)")
            }
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
