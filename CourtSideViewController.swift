//
//  CourtSideViewController.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 3/28/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//

import UIKit

class CourtSideViewController: UIViewController, UITextFieldDelegate, ESTBeaconManagerDelegate {

    

    
    

    
    var matchStatus = Bool()

    var currentWins: Int = 0
    
    var currentLosses: Int = 0
    
    var currentGames: Int = 0
    
    
    
    @IBAction func wonButton(sender: AnyObject) {
        
        
        matchStatus = true
        println(matchStatus)
        submitTitle.text = "Submit Win"
        
        /*
        PFUser.currentUser().fetchInBackgroundWithBlock { (user: PFObject!, error: NSError!) -> Void in
            var winCount = user.objectForKey("totalWins") as Int
            winCount++;
            PFUser.currentUser().setObject(winCount, forKey: "totalWins")
            PFUser.currentUser().save()
            
            println(winCount)
            
            var gameCount = user.objectForKey("totalGames") as Int; gameCount++;
            PFUser.currentUser().setObject(gameCount, forKey: "totalGames")
            PFUser.currentUser().save()
            
            println(gameCount)
            
            
            
            
            ///////
            
            
            
            ///////
            
            
        }
        */
        
    }
    
    
    @IBAction func lostButton(sender: AnyObject) {
        
        
        matchStatus = false
        println(matchStatus)
        submitTitle.text = "Submit Loss"
        
        /*
        PFUser.currentUser().fetchInBackgroundWithBlock { (user: PFObject!, error: NSError!) -> Void in
            var lossCount = user.objectForKey("totalLosses") as Int; lossCount++;
            PFUser.currentUser().setObject(lossCount, forKey: "totalLosses")
            PFUser.currentUser().save()
            
            println(lossCount)
            
            var gameCount = user.objectForKey("totalGames") as Int; gameCount++;
            PFUser.currentUser().setObject(gameCount, forKey: "totalGames")
            PFUser.currentUser().save()
            
            println(gameCount)
            
            
        }
        */
        
    }
    
    
    @IBOutlet weak var enterMatchPoints: UITextField!
    
    
    
    @IBAction func submitMatchScore(sender: AnyObject)
    {
        
        
        
        
        if matchStatus == true {
            
            PFUser.currentUser().fetchInBackgroundWithBlock { (user: PFObject!, error: NSError!) -> Void in
                var winCount = user.objectForKey("totalWins") as Int
                winCount++;
                PFUser.currentUser().setObject(winCount, forKey: "totalWins")
                PFUser.currentUser().save()
                
                println(winCount)
                
                var gameCount = user.objectForKey("totalGames") as Int; gameCount++;
                PFUser.currentUser().setObject(gameCount, forKey: "totalGames")
                PFUser.currentUser().save()
                
                println(gameCount)
                
                var winPct = (winCount * 100) / gameCount
                PFUser.currentUser().setObject(winPct, forKey: "winPct")
                PFUser.currentUser().save()
                
                println(winPct)
            
        }
           
        }
        
            else {
            
                PFUser.currentUser().fetchInBackgroundWithBlock { (user: PFObject!, error: NSError!) -> Void in
                var lossCount = user.objectForKey("totalLosses") as Int; lossCount++;
                PFUser.currentUser().setObject(lossCount, forKey: "totalLosses")
                PFUser.currentUser().save()
                
                println(lossCount)
                
                var gameCount = user.objectForKey("totalGames") as Int; gameCount++;
                PFUser.currentUser().setObject(gameCount, forKey: "totalGames")
                PFUser.currentUser().save()
                
                println(gameCount)
                
                var winCount = user.objectForKey("totalWins") as Int
                var winPct = (winCount * 100) / gameCount
                PFUser.currentUser().setObject(winPct, forKey: "winPct")
                PFUser.currentUser().save()
                    
                println(winPct)
                
            }
            }
        
        
        
        var match = PFObject(className: "Match") // Score
        
        match.setObject(enterMatchPoints.text.toInt(), forKey: "score")
        
        match.setObject(PFUser.currentUser(), forKey: "User")
        
        match.setObject(matchStatus, forKey: "result")
        
        
        
        match.saveInBackgroundWithBlock
            {(success: Bool!, error: NSError!) -> Void in
                
                if success == true {
                    println("Score created with ID: \(match.objectId)")
                    
                    
                }
                else {
                    println(error)
                }
                
                
        }
        
        
        
        
        
        
        
        
        
        
        
        
        /*
        // {
        /////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////
        //
        //
        //
        
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
        //
        //
        /////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////
        }
        */
    
    }
    
    
    ///////////////////////////////////////////////////////////
    //
    // performs check to ensure there are only numbers entered
    //
    ///////////////////////////////////////////////////////////
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var result = true
        let prospectiveText = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        if textField == enterMatchPoints {
            if countElements(string) > 0 {
                let disallowedCharacterSet = NSCharacterSet(charactersInString: "0123456789.-").invertedSet
                let replacementStringIsLegal = string.rangeOfCharacterFromSet(disallowedCharacterSet) == nil
                
                let resultingStringLengthIsLegal = countElements(prospectiveText) <= 6
                
                let scanner = NSScanner(string: prospectiveText)
                let resultingTextIsNumeric = scanner.scanDecimal(nil) && scanner.atEnd
                
                let resultingTextIsNumericValue = countElements(prospectiveText) <= 15
                
                
                result = replacementStringIsLegal &&
                    resultingStringLengthIsLegal &&
                    resultingTextIsNumeric && resultingTextIsNumericValue
            }
        }
        return result
    }
    
    /////////////////////////////////////////////////////////////
    //
    // don't forget to add UITextFieldDelegate to class def.
    // and to add the numberField.delegate = self in viewDidLoad
    //
    /////////////////////////////////////////////////////////////
    
    
    
    @IBOutlet weak var submitTitle: UILabel!

    
    
    
    @IBAction func join(sender: AnyObject) {
        
        
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

    

    @IBAction func finish(sender: AnyObject) {
        
        
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
        
        enterMatchPoints.delegate = self
    
        
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
