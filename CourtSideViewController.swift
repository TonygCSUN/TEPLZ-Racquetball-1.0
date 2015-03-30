//
//  CourtSideViewController.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 3/28/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//

import UIKit

class CourtSideViewController: UIViewController, ESTBeaconManagerDelegate {

    
    
    
    var currentWins = Int()
    var currentGames = Int()
    
    var wins = 0
    var games = 0
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    @IBAction func indexChanged(sender: AnyObject)
    {
        //
        switch segmentedControl.selectedSegmentIndex
        {
            //
        case 0:
            wins = 1
            games = 1
            
            /*
            var user = PFObject(className: "User")
            // // var user = PFQuery(className: "User")
            
            user.setObject((wins), forKey: "totalWins")
            user.setObject([games + currentGames], forKey: "totalGames")
            user.saveInBackgroundWithBlock {
                (success: Bool!, error: NSError!) -> Void in
                
                if success == true {
                    
                    println("Score created with ID: \(user.objectId)")
                    
                } else {
                    
                    println(error)
                    
                }
                
                
            }
            */
            // textLabel.text = "Loss";
            println(wins)
            
        case 1:
            wins = 0
            games = 1
            
            /*
            var score = PFObject(className: "User")
            score.setObject([games], forKey: "totalGames")
            score.saveInBackgroundWithBlock {
                (success: Bool!, error: NSError!) -> Void in
                
                if success == true {
                    
                    println("Score created with ID: \(score.objectId)")
                    
                } else {
                    
                    println(error)
                    
                }
                
                
            }
            */

            // textLabel.text = "WIN!";
            
            println(games)
            
        default:
            break;
        }
        
        
    }
    
    
    
    @IBAction func submitMatchScore(sender: AnyObject)
    {
        
        println(wins)
        println(games)
        
        
        var user = PFObject(className: "User")
        // // var user = PFQuery(className: "User")
        
        user.setObject((wins), forKey: "totalWins")
        user.setObject((games), forKey: "totalGames")
        // user.setObject([games + currentGames], forKey: "totalGames")
        user.saveInBackgroundWithBlock {
        (success: Bool!, error: NSError!) -> Void in
        
        if success == true {
        
        println("Score created with ID: \(user.objectId)")
        
        } else {
        
        println(error)
        
        }
        
        
        }

        
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        var newQuery = PFQuery(className:"User")
        newQuery.getObjectInBackgroundWithId("5cbCG2EiqK") {
            (totalWins: PFObject!, error: NSError!) -> Void in
            if error == nil && totalWins != nil {
                println(totalWins)
                let currentWins = totalWins["TotalWins"] as Int
            }
            else {
                println(error)
            }
            
        }
        
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
