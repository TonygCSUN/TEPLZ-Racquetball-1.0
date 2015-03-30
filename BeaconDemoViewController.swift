//
//  BeaconDemoViewController.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 3/29/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//

import UIKit

class BeaconDemoViewController: UIViewController, ESTBeaconManagerDelegate {

    @IBOutlet weak var beaconLabel: UILabel!
    
    let webView = UIWebView()
    var buttonWeb = UIBarButtonItem()
    let beaconManager : ESTBeaconManager = ESTBeaconManager();
    
    var wins = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    func beaconManager(manager: ESTBeaconManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: ESTBeaconRegion!) {
        
        if beacons.count > 0 {
            var firstBeacon : ESTBeacon = beacons.first! as ESTBeacon
            
            self.beaconLabel.text = ("\(textForPromimity(firstBeacon.proximity))")
            
        }
    }
    
    func textForPromimity(proximity:CLProximity) -> (NSString)
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
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
