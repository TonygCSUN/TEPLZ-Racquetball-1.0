//
//  BeaconViewController.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 3/28/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//

import UIKit

class BeaconViewController: UIViewController, ESTBeaconManagerDelegate {

    let beaconManager : ESTBeaconManager = ESTBeaconManager()
    
    
    func beaconInRange() {
        
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
            
            // self.beaconLabel.text = ("\(textForPromimity(firstBeacon.proximity))")
            
            func viewDidAppear(animated: Bool) {
                if PFUser.currentUser() != nil {
                    
                    self.performSegueWithIdentifier("jumpToBeaconPage", sender: self)
                    
                }
                else {
                    // reload()
                }
                
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
