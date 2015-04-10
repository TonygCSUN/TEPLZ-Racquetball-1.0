//
//  LeaderBoardViewController.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 3/15/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//

import UIKit

class LeaderBoardViewController:  UIViewController, ESTBeaconManagerDelegate {
    


    
    let beaconManager : ESTBeaconManager = ESTBeaconManager()
    
    
    @IBOutlet weak var winsCount: UILabel!
    
    
    @IBOutlet weak var winPercentage: UILabel!
    
    
    @IBOutlet weak var gamesCount: UILabel!
    
    
    @IBOutlet weak var username: UILabel!
    
    
    @IBAction func whoAmI(sender: AnyObject) {
        if PFUser.currentUser() != nil {
            
            username.text = ("\(PFUser.currentUser().username)")
            
        }
        else {
            // reload()
        }
    }
    

    @IBAction func logout(sender: AnyObject) {
        
        PFUser.logOut()
        var currentUser = PFUser.currentUser() // this will now be nil
        
        // NEED CODE TO DISPLAY POPUP OF "OK" DISMISS BUTTON
        
    }
    
    
    
    @IBAction func myStatsButton(sender: AnyObject) {
        
        PFUser.currentUser().fetchInBackgroundWithBlock { (user: PFObject!, error: NSError!) -> Void in
            var winCount = user.objectForKey("totalWins") as Int
            self.winsCount.text = "\(winCount)"
        }
        
        PFUser.currentUser().fetchInBackgroundWithBlock { (user: PFObject!, error: NSError!) -> Void in
            var gameCount = user.objectForKey("totalGames") as Int
            self.gamesCount.text = "\(gameCount)"
        }
        
        PFUser.currentUser().fetchInBackgroundWithBlock { (user: PFObject!, error: NSError!) -> Void in
            var winPercent = user.objectForKey("winPct") as Int
            self.winPercentage.text = "\(winPercent)"
        }

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

        
        
        
        //set beacon manager delegate
        beaconManager.delegate = self;
        
        //create the beacon region
        var beaconRegion : ESTBeaconRegion = ESTBeaconRegion(proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D"), major: 26050, minor: 64706, identifier: "regionName")
        
        //Opt in to be notified upon entering and exiting region
        beaconRegion.notifyOnEntry = true
        beaconRegion.notifyOnExit = true
        
        //beacon manager asks permission from user
        beaconManager.startRangingBeaconsInRegion(beaconRegion)
        beaconManager.startMonitoringForRegion(beaconRegion)
        beaconManager.requestAlwaysAuthorization()
    }
    

    

    @IBAction func refresh(sender: AnyObject) {
        
        
        PFUser.currentUser().fetchInBackgroundWithBlock { (user: PFObject!, error: NSError!) -> Void in
            var winCount = user.objectForKey("totalWins") as Int
            self.winsCount.text = "\(winCount)"
            println(winCount)
        }
        
        PFUser.currentUser().fetchInBackgroundWithBlock { (user: PFObject!, error: NSError!) -> Void in
            var gameCount = user.objectForKey("totalGames") as Int
            self.gamesCount.text = "\(gameCount)"
            println(gameCount)
        }
        
        PFUser.currentUser().fetchInBackgroundWithBlock { (user: PFObject!, error: NSError!) -> Void in
            var winPercent = user.objectForKey("winPct") as Int
            self.winPercentage.text = "\(winPercent)"
            println(winPercent)
        }
        
        
        
        /*
        /////////////
        
        PFUser.currentUser().fetchInBackgroundWithBlock { (user: PFObject!, error: NSError!) -> Void in
            var user: AnyObject! = user.objectForKey("objectId​")
            
            println(user)
        }

        
        
        PFUser.currentUser().fetchInBackgroundWithBlock { (user: PFObject!, error: NSError!) -> Void in
            var active = user.objectForKey("activePlayer") as Bool
            
            println(active)
            
        }
        
        
        PFUser.currentUser().fetchInBackgroundWithBlock { (user: PFObject!, error: NSError!) -> Void in
            var usernames = user.objectForKey("username") as String
            
            println(usernames)
            
        }
        
        //////////////
        */
            
            
        /*
        
        var query = PFUser.query()
        query.whereKey("winPct", greaterThan: 50)
        query.orderByAscending("winPct")
        query.limit = 5
        query.findObjectsInBackgroundWithBlock
            {(objects :[AnyObject]!, error: NSError!)->Void in
                var objectOne: PFObject = objects[0] as PFObject
                println("WOOP!")
                println(objects.debugDescription)
                println(objects.count)
                println(objects.description)
        }
        */
        
    }

    
 

    
    
    func beaconManager(manager: ESTBeaconManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: ESTBeaconRegion!) {
        
        if beacons.count > 0 {
            var firstBeacon : ESTBeacon = beacons.first! as ESTBeacon
            
            
            
            // self.beaconLabel.text = ("\(textForPromimity(firstBeacon.proximity))")
            
        }
    }
    
    
    
    
    //
    /*
    func textForPromimity(proximity:CLProximity) -> (NSString)
    {
        var distance : NSString!
        
        switch(proximity)
        {
        case .Far:
            println("Far")
            distance = "far"
            beaconLabel.textColor = UIColor.redColor()
            return distance
        case .Near:
            println("Near")
            distance = "Near"
            beaconLabel.textColor = UIColor.purpleColor()
            return distance
        case .Immediate:
            println("Immediate")
            distance = "Immediate"
            beaconLabel.textColor = UIColor.greenColor()
            return distance
        case .Unknown:
            println("Unknown")
            distance = "Unknown"
            return distance
        default:
            break;
        }
        return distance
    }
    //
    */

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
    
    ////////////////////////
    ////////////////////////
    //
    // this loads the temp tableview to test functionality
    //
    ////////////////////////
    ////////////////////////
    


    
    
    
    
    
    
    
    ////////////////////////
    ////////////////////////
    //
    // this loads the temp tableview to test functionality
    //
    ////////////////////////
    ////////////////////////
    
}



