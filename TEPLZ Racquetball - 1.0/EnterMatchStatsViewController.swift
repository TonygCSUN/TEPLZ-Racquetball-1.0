//
//  EnterMatchStatsViewController.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 3/15/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//

import UIKit

class EnterMatchStatsViewController: UIViewController,UINavigationControllerDelegate, UITextFieldDelegate {

    
    
    
    
    @IBAction func getTotals(sender: AnyObject) {
        
        PFUser.currentUser().fetchInBackgroundWithBlock { (user: PFObject!, error: NSError!) -> Void in
            var winCount = user.objectForKey("totalWins") as Int
            winCount++;
            PFUser.currentUser().setObject(winCount, forKey: "totalWins")
            PFUser.currentUser().save()
            
            println(winCount)
            
            var lossCount = user.objectForKey("totalLosses") as Int; lossCount++;
            PFUser.currentUser().setObject(lossCount, forKey: "totalLosses")
            PFUser.currentUser().save()
            
            println(lossCount)
            
            var gameCount = user.objectForKey("totalGames") as Int; gameCount++;
            PFUser.currentUser().setObject(gameCount, forKey: "totalGames")
            PFUser.currentUser().save()
            
            println(gameCount)
            
            
        }
        
    }
    
    
    
    @IBAction func debug(sender: AnyObject) {
        //
        var query = PFUser.query()
        query.whereKey("username", equalTo: "testparse1")
        query.findObjectsInBackgroundWithBlock
            {(objects :[AnyObject]!, error: NSError!)->Void in
                var objectOne: PFObject = objects[0] as PFObject
                println("WOOP!")
                println(objects.debugDescription)
                println(objects.count)
        }
        
    }
    
    
    

    
    
    
    
    

    
    
    
    var currentWins: Int = 0
    
    var currentLosses: Int = 0
    
    var currentGames: Int = 0
    
    
    @IBOutlet weak var enterMatchPoints: UITextField!
    
    
    @IBAction func submitMatch(sender: AnyObject) {
    

        if matchStatus == true {
        currentWins = ++currentWins
        }
        else {
            currentLosses = ++currentLosses
        }
        
        currentGames = ++currentGames
        
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
    
    
    
    
    /////////////////////////////////////////////////////////////
    //
    // function for WIN / LOSS method
    //
    //
    /////////////////////////////////////////////////////////////

    
    var matchStatus = Bool()
    
    // set a get function to get latest totalWins
    // then set totalWins to that value
    


    
    @IBOutlet weak var textLabel: UILabel!
    
   
    

    @IBAction func winButton(sender: AnyObject) {
        
        matchStatus = true
        println(matchStatus)
        
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
        
    }

    
    @IBAction func lostButton(sender: AnyObject) {
        
        matchStatus = false
        println(matchStatus)
        
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
    
    }




    //////////////////////////////////////////////////////
    //
    // this is new code to add match records to the user
    //
    //
    //////////////////////////////////////////////////////
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //////////////////////////////////////////////////////
    //
    // end
    //
    //
    //////////////////////////////////////////////////////
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        enterMatchPoints.delegate = self
        
        
        
        // let currentUser = PFUser.currentUser()
        
        
        /*
        
        
        // Do any additional setup after loading the view.
        
        var match = PFObject(className: "Match") // Score
        
        // match.setObject(winLossResult, forKey: "result")
        match.setObject(enterMatchPoints.text, forKey: "score")
        // match.setObject(15, forKey: "score")
        match.setObject(PFUser.currentUser(), forKey: "User")
        // score.saveInBackgroundWithTarget("", selector: nil)
        match.saveInBackgroundWithBlock
            {(success: Bool!, error: NSError!) -> Void in
                
                if success == true {
                    println("Score created with ID: \(match.objectId)")
                }
                else {
                    println(error)
                }
                
                
        }
        
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent)
    {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool
    {
        //
        textField.resignFirstResponder()
        
        return true
        
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
