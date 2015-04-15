//
//  CourtSideViewController.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 3/28/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//

import UIKit

class CourtSideViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, ESTBeaconManagerDelegate {

    @IBOutlet weak var ranging: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var beacons: [ESTBeacon]?
    
    var players: [PFUser]?
    
    var matchStatus = Bool()

    var currentWins: Int = 0
    
    var currentLosses: Int = 0
    
    var currentGames: Int = 0
    
    var lastSeenBeacon: ESTBeacon? = nil
    
    
    
    
    @IBAction func wonButton(sender: AnyObject) {
        
        
        matchStatus = true
        println(matchStatus)
        submitTitle.text = "Submit Win"
        submitTitle.textColor = UIColor.blueColor()
        
        
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
        submitTitle.textColor = UIColor.redColor()
        
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
    
    
    @IBOutlet weak var enterTotalMatchPoints: UITextField!
    
    
    @IBOutlet weak var submitStatus: UIButton!
    
    
    @IBOutlet weak var checkLogin: UILabel!
    
    
    @IBAction func submitMatchScore(sender: AnyObject)
    {
        

            if PFUser.currentUser() == nil {
            
                checkLogin.text = "Please Sign in"
            
            }
        
        
            if
                
                matchStatus == true && PFUser.currentUser() != nil
            {
            
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
                    
                    var matchPointCount = user.objectForKey("totalEarnedMatchPoints") as Int
                    matchPointCount += self.enterMatchPoints.text.toInt()!;
                    PFUser.currentUser().setObject(matchPointCount, forKey: "totalEarnedMatchPoints")
                    PFUser.currentUser().save()
                    
                    println(matchPointCount)

                    
                    var maxMatchPointCount = user.objectForKey("totalMatchPoints") as Int
                    maxMatchPointCount += self.enterTotalMatchPoints.text.toInt()!;
                    PFUser.currentUser().setObject(maxMatchPointCount, forKey: "totalMatchPoints")
                    PFUser.currentUser().save()
                    
                    println(maxMatchPointCount)

                    
                    self.submitTitle.text = "Submit Win"
                    self.submitTitle.textColor = UIColor.blackColor()
                    
                    self.enterTotalMatchPoints.text = nil
                    self.enterMatchPoints.text = nil
            
                }
           
            }
        
            if
            
                matchStatus == false && PFUser.currentUser() != nil
            {
            
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
                    
                    var matchPointCount = user.objectForKey("totalEarnedMatchPoints") as Int
                    matchPointCount += self.enterMatchPoints.text.toInt()!;
                    PFUser.currentUser().setObject(matchPointCount, forKey: "totalEarnedMatchPoints")
                    PFUser.currentUser().save()
                        
                    println(matchPointCount)
                        
                    
                    var maxMatchPointCount = user.objectForKey("totalMatchPoints") as Int
                    maxMatchPointCount += self.enterTotalMatchPoints.text.toInt()!;
                    PFUser.currentUser().setObject(maxMatchPointCount, forKey: "totalMatchPoints")
                    PFUser.currentUser().save()
                        
                    println(maxMatchPointCount)
                    
                        
                    self.submitTitle.text = "Submit Win"
                    self.submitTitle.textColor = UIColor.blackColor()
                        
                    self.enterTotalMatchPoints.text = nil
                    self.enterMatchPoints.text = nil
                
                    }
            }
        
            else
            {
                //
                checkLogin.text = "Please Sign in"
                return;
            }
        
            

        var match = PFObject(className: "Match") // Score
        
        // match.setObject(enterMatchPoints.text.toInt(), forKey: "score")
        
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
        PFUser.currentUser().fetchInBackgroundWithBlock { (user: PFObject!, error: NSError!) -> Void in
            var matchPointCount = user.objectForKey("totalEarnedMatchPoints") as Int
            matchPointCount += self.enterTotalMatchPoints.text.toInt()!;
            PFUser.currentUser().setObject(matchPointCount, forKey: "totalEarnedMatchPoints")
            PFUser.currentUser().save()
            
        } */
        
        
    }

    func getHighscores() {
        self.players = [];
        var query: PFQuery = PFQuery(className: "_User")
        query.whereKey("activePlayer", equalTo: true)
        query.findObjectsInBackgroundWithBlock({ (playersReturned: [AnyObject]!, error: NSError!) -> Void in
            for object in playersReturned {
                var objectTemp = object as PFUser
                self.players?.append(objectTemp)
            }
            self.tableView.reloadData()
        })
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
    
    
    
    
    ///////////////////////////////////////////////////////////
    //
    // performs check to ensure there are only numbers entered - secondTextField
    //
    ///////////////////////////////////////////////////////////
    
    func secondTextField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var result = true
        let prospectiveText = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        if textField == enterTotalMatchPoints {
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
    // and to add the numberField.delegate = self in viewDidLoad - secondTextField
    //
    /////////////////////////////////////////////////////////////
    
    
    
    
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
    
    
    @IBOutlet weak var submitTitle: UILabel!

    
    
    // this makes the player active status TRUE
    @IBAction func join(sender: AnyObject) {
        
        
        if PFUser.currentUser() == nil {
            
            checkLogin.text = "Please Sign in"
            
        }
        else{
            
            //
        
            PFUser.currentUser().setObject(true, forKey: "activePlayer")
        
            PFUser.currentUser().saveInBackgroundWithBlock {
            (success: Bool!, error: NSError!) -> Void in
            
            if (success != nil) {
                println("Object modified")
                
                }
            else {
                println("Error: \(error)")
                }
            }
        
        }
    
    }

    
    // this makes the player active status FALSE
    @IBAction func finish(sender: AnyObject) {
        
        if PFUser.currentUser() == nil {
            
            checkLogin.text = "Please Sign in"
            
        }
        else{
            
            //
         
            PFUser.currentUser().setObject(false, forKey: "activePlayer")
        
            PFUser.currentUser().saveInBackgroundWithBlock {
            (success: Bool!, error: NSError!) -> Void in
            
            if (success != nil) {
                println("Object created")
                
                }
            else {
                println("Error: \(error)")
                
                }
            }
            
        }
        
    }
    
    
    let beaconManager : ESTBeaconManager = ESTBeaconManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        players = []
        
        enterMatchPoints.delegate = self
        enterTotalMatchPoints.delegate = self
        
        
        //set beacon manager delegate
        beaconManager.delegate = self;
        
        // blue: (major: 18059, minor: 43132)
        // stone: (major: 59864, minor: 22652)
        // ice: (major: 26050, minor: 64706)
        
        //create the beacon region // blue beacon
        var beaconRegion : ESTBeaconRegion = ESTBeaconRegion(proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D"), identifier: "regionName")
        
        //Opt in to be notified upon entering and exiting region
        beaconRegion.notifyOnEntry = true
        beaconRegion.notifyOnExit = true
        
        //beacon manager asks permission from user
        beaconManager.startRangingBeaconsInRegion(beaconRegion)
        beaconManager.startMonitoringForRegion(beaconRegion)
        beaconManager.requestAlwaysAuthorization()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
    }
        
    func beaconManager(manager: ESTBeaconManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: ESTBeaconRegion!) {
            /*
            /////
            let viewController:BeaconDemoViewController = window?.rootViewController as BeaconDemoViewController
            viewController.beacons = beacons as [CLBeacon]?
            viewController.tableView!.reloadData()
            /////
            */
        
        
        
            
        

            if beacons.count > 0 {
                //println(beacons.count)
                var firstBeacon : ESTBeacon = beacons.first! as ESTBeacon
                if lastSeenBeacon == nil {
                    lastSeenBeacon = firstBeacon
                    getHighscores()
                }
                else {
                    var uuidString = firstBeacon.proximityUUID.UUIDString
                    var distance = firstBeacon.proximity
                    var lastUUIDString = lastSeenBeacon!.proximityUUID.UUIDString
                    var lastDistance = lastSeenBeacon!.proximity
                    if uuidString == lastUUIDString && distance != CLProximity.Far && distance != CLProximity.Unknown {
                        return
                    }
                    else if distance == CLProximity.Far || distance == CLProximity.Unknown {
                        lastSeenBeacon = firstBeacon;
                        players = []
                        tableView.reloadData()
                    }
                    else {
                        lastSeenBeacon = firstBeacon
                        getHighscores()
                    }
                }
                self.ranging.text = ("\(textForProximity(firstBeacon.proximity))")
                
                
            }
    
        
    }
        

       
        
    func textForProximity(proximity:CLProximity) -> (NSString)
        {
            var distance : NSString!
            
            switch(proximity)
            {
            case .Far:
                println("Far from court")
                distance = "FAR"
                ranging.textColor = UIColor.redColor()
                return distance
            case .Near:
                
                println("Near")
                distance = "NEAR"
                ranging.textColor = UIColor.purpleColor()
                return distance
            case .Immediate:
                
                println("Immediate")
                distance = "IMMEDIATE"
                ranging.textColor = UIColor.greenColor()
                return distance
            case .Unknown:
                println("Unknown")
                distance = "UNKNOWN"
                return distance
            default:
                break;
            }
            return distance
        }
    
        
        
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //check for region failure
    func beaconManager(manager: ESTBeaconManager!, monitoringDidFailForRegion region: ESTBeaconRegion!, withError error: NSError!) {
        println("Region did fail: \(manager) \(region) \(error)")
    }
    
    //checks permission status
    func beaconManager(manager: ESTBeaconManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        println("Status: \(status)")
    }
    
    //beacon entered region
    func beaconManager(manager: ESTBeaconManager!, didEnterRegion region: ESTBeaconRegion!) {
        
        var notification : UILocalNotification = UILocalNotification()
        notification.alertBody = "Youve done it!"
        notification.soundName = "Default.mp3"
        println("Youve entered")
        UIApplication.sharedApplication().presentLocalNotificationNow(notification)
    }
    
    //beacon exited region
    func beaconManager(manager: ESTBeaconManager!, didExitRegion region: ESTBeaconRegion!) {
        
        var notification : UILocalNotification = UILocalNotification()
        notification.alertBody = "Youve exited!"
        notification.soundName = "Default.mp3"
        println("Youve exited")
        UIApplication.sharedApplication().presentLocalNotificationNow(notification)
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if(players != nil) {
            return players!.count
        } else {
            return 0
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell? =
        tableView.dequeueReusableCellWithIdentifier("MyIdentifier") as? UITableViewCell
        
        if(cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyIdentifier")
            cell!.selectionStyle = UITableViewCellSelectionStyle.None
        }
        /*
        let beacon:ESTBeacon = beacons![indexPath.row]
        var proximityLabel:String! = ""
        
        switch beacon.proximity {
        case CLProximity.Far:
        proximityLabel = "Far"
        case CLProximity.Near:
        proximityLabel = "Near"
        case CLProximity.Immediate:
        proximityLabel = "Immediate"
        case CLProximity.Unknown:
        proximityLabel = "Unknown"
        }
        */
        let tablePlayer = players![indexPath.row] as PFUser
        cell!.textLabel!.text = tablePlayer.objectForKey("username") as? String
        cell!.detailTextLabel!.text = tablePlayer.objectForKey("winPct") as? String;
        /*
        let detailLabel:String = "Major: \(beacon.major.integerValue), " +
        "Minor: \(beacon.minor.integerValue), " +
        "RSSI: \(beacon.rssi as Int), " +
        "UUID: \(beacon.proximityUUID.UUIDString)"
        cell!.detailTextLabel!.text = detailLabel
        */
        return cell!
    }
    
    
    
    
    
    
    
    
    
    
    
    
    ////////////////////
    ////////////////////
    ////////////////////
    
    /*
    //check for region failure
    func beaconManager(manager: ESTBeaconManager!, monitoringDidFailForRegion region: ESTBeaconRegion!, withError error: NSError!) {
        println("Region did fail: \(manager) \(region) \(error)")
    }
    
    //checks permission status
    func beaconManager(manager: ESTBeaconManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        println("Status: \(status)")
    }
        */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
