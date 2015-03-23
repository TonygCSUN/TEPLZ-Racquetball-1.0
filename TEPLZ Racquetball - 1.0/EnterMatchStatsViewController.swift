//
//  EnterMatchStatsViewController.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 3/15/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//

import UIKit

class EnterMatchStatsViewController: UIViewController,UINavigationControllerDelegate, UITextFieldDelegate {

    
    
    @IBOutlet weak var enterMatchPoints: UITextField!
    
    
    @IBAction func submitMatch(sender: AnyObject) {
    
        
        
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
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    @IBAction func indexChanged(sender: AnyObject)
    {
        //
        switch segmentedControl.selectedSegmentIndex
        {
            //
        case 0:
            matchStatus = false
            textLabel.text = "Loss";
            
        case 1:
            matchStatus = true
            textLabel.text = "WIN!";
            
        default:
            break;
        }
    }

    
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
