//
//  BeaconDemoViewController.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 3/29/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//

//  this video was helpful.object
//  https://youtu.be/GvsEhDEGO_k
//  PhillyDev716



import UIKit


class BeaconDemoViewController: UIViewController, ESTBeaconManagerDelegate, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var beaconLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var beacons: [ESTBeacon]?
    
    var players: [PFUser]?

    /*
    /////
    var beacons: [CLBeacon]?
    
    var window: UIWindow?
    var locationManager: CLLocationManager?
    var lastProximity: CLProximity?
    ////
    */
    
    
    let webView = UIWebView()
    var buttonWeb = UIBarButtonItem()
    let beaconManager : ESTBeaconManager = ESTBeaconManager();
    
    var wins = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        players = []
        
        //set beacon manager delegate
        beaconManager.delegate = self;
        
        // blue: (major: 18059, minor: 43132)
        // stone: (major: 59864, minor: 22652)
        // ice: (major: 26050, minor: 64706)
        
        //create the beacon region // blue beacon
        var beaconRegion : ESTBeaconRegion = ESTBeaconRegion(proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D"), major: 26050, minor: 64706, identifier: "regionName")
        
        //Opt in to be notified upon entering and exiting region
        beaconRegion.notifyOnEntry = true
        beaconRegion.notifyOnExit = true
        
        //beacon manager asks permission from user
        beaconManager.startRangingBeaconsInRegion(beaconRegion)
        beaconManager.startMonitoringForRegion(beaconRegion)
        beaconManager.requestAlwaysAuthorization()
        // func you made
    }
    
    func beaconManager(manager: ESTBeaconManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: ESTBeaconRegion!) {
        /*
        /////
        let viewController:BeaconDemoViewController = window?.rootViewController as BeaconDemoViewController
        viewController.beacons = beacons as [CLBeacon]?
        viewController.tableView!.reloadData()
        /////
        */
        
        var query: PFQuery = PFQuery(className: "_User")
        query.whereKey("activePlayer", equalTo: true)
        query.findObjectsInBackgroundWithBlock({ (playersReturned: [AnyObject]!, error: NSError!) -> Void in
            for object in playersReturned {
                var objectTemp = object as PFUser
                self.players?.append(objectTemp)
            }
            self.tableView.reloadData()
        })
        
        if beacons.count > 0 {
            var firstBeacon : ESTBeacon = beacons.first! as ESTBeacon
            
            self.beaconLabel.text = ("\(textForProximity(firstBeacon.proximity))")
            
            
        }
        

    }
    /////////
    // func DO SOMETHING
    /////////
    
    func textForProximity(proximity:CLProximity) -> (NSString)
    {
        var distance : NSString!
        
        switch(proximity)
        {
        case .Far:
            println("Far")
            distance = "FAR \(wins)"
            beaconLabel.textColor = UIColor.redColor()
            return distance
        case .Near:
            wins = ++wins
            println("Near")
            distance = "NEAR \(wins)"
            beaconLabel.textColor = UIColor.purpleColor()
            return distance
        case .Immediate:
            wins = ++wins
            println("Immediate")
            distance = "IMMEDIATE \(wins)"
            beaconLabel.textColor = UIColor.greenColor()
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


/*
///////////

extension BeaconDemoViewController: UITableViewDataSource {
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            if(beacons != nil) {
                return beacons!.count
            } else {
                return 0
            }
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var cell:UITableViewCell? =
            tableView.dequeueReusableCellWithIdentifier("MyIdentifier") as? UITableViewCell
            
            if(cell == nil) {
                cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyIdentifier")
                cell!.selectionStyle = UITableViewCellSelectionStyle.None
            }
            
            let beacon:CLBeacon = beacons![indexPath.row]
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
            
            cell!.textLabel!.text = proximityLabel
            
            let detailLabel:String = "Major: \(beacon.major.integerValue), " +
                "Minor: \(beacon.minor.integerValue), " +
                "RSSI: \(beacon.rssi as Int), " +
            "UUID: \(beacon.proximityUUID.UUIDString)"
            cell!.detailTextLabel!.text = detailLabel
            
            return cell!
    }
}

extension BeaconDemoViewController: UITableViewDelegate {
    
}

//////////
*/


