//
//  CourtSideBeaconTableViewController.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 3/30/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//

import UIKit
import CoreLocation

class CourtSideBeaconTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var window: UIWindow?
    var locationManager: CLLocationManager?
    var lastProximity: CLProximity?
    
    var beacons: [CLBeacon]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // this is code to begin ranging iBeacons in the background
        
        
        let uuidString = "B9407F30-F5F8-466E-AFF9-25556B57FE6D"
        let beaconIdentifier = "iBeaconModules.us"
        let beaconUUID = NSUUID(UUIDString: uuidString)!
        let beaconRegion:CLBeaconRegion = CLBeaconRegion(proximityUUID: beaconUUID,
            identifier: beaconIdentifier)
        
        locationManager = CLLocationManager()
        
        if(locationManager!.respondsToSelector("requestAlwaysAuthorization")) {
            locationManager!.requestAlwaysAuthorization()
        }
        
        locationManager!.delegate = self
        locationManager!.pausesLocationUpdatesAutomatically = false
        
        locationManager!.startMonitoringForRegion(beaconRegion)
        locationManager!.startRangingBeaconsInRegion(beaconRegion)
        locationManager!.startUpdatingLocation()
        
        /*
        if(respondsToSelector("registerUserNotificationSettings:")) {
            application.registerUserNotificationSettings(
                UIUserNotificationSettings(
                    forTypes: UIUserNotificationType.Alert | UIUserNotificationType.Sound,
                    categories: nil
                )
            )
        } */
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension CourtSideBeaconTableViewController: UITableViewDataSource {
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

extension CourtSideBeaconTableViewController: UITableViewDelegate {
    
}

/////

extension CourtSideBeaconTableViewController: CLLocationManagerDelegate {
    
    
    ////
    func sendLocalNotificationWithMessage(message: String!, playSound: Bool) {
        let notification:UILocalNotification = UILocalNotification()
        notification.alertBody = message
        
        if(playSound) {
            // classic star trek communicator beep
            //	http://www.trekcore.com/audio/
            //
            // note: convert mp3 and wav formats into caf using:
            //	"afconvert -f caff -d LEI16@44100 -c 1 in.wav out.caf"
            // http://stackoverflow.com/a/10388263
            
            notification.soundName = "tos_beep.caf";
        }
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    ///
    
    
    
    func locationManager(manager: CLLocationManager!,
        didRangeBeacons beacons: [AnyObject]!,
        inRegion region: CLBeaconRegion!) {
            let viewController:CourtSideBeaconTableViewController = window!.rootViewController as CourtSideBeaconTableViewController
            viewController.beacons = beacons as [CLBeacon]?
            viewController.tableView!.reloadData()
            
            NSLog("didRangeBeacons");
            var message:String = ""
            
            var playSound = false
            
            if(beacons.count > 0) {
                let nearestBeacon:CLBeacon = beacons[0] as CLBeacon
                
                if(nearestBeacon.proximity == lastProximity ||
                    nearestBeacon.proximity == CLProximity.Unknown) {
                        return;
                }
                lastProximity = nearestBeacon.proximity;
                
                switch nearestBeacon.proximity {
                case CLProximity.Far:
                    message = "You are far away from the beacon"
                    playSound = true
                case CLProximity.Near:
                    message = "You are near the beacon"
                case CLProximity.Immediate:
                    message = "You are in the immediate proximity of the beacon"
                case CLProximity.Unknown:
                    return
                }
            } else {
                
                if(lastProximity == CLProximity.Unknown) {
                    return;
                }
                
                message = "No beacons are nearby"
                playSound = true
                lastProximity = CLProximity.Unknown
            }
            
            NSLog("%@", message)
            sendLocalNotificationWithMessage(message, playSound: playSound)
    }
    
    /*
    ///
    func locationManager(manager: CLLocationManager!,
    didEnterRegion region: CLRegion!) {
    manager.startRangingBeaconsInRegion(region as CLBeaconRegion)
    manager.startUpdatingLocation()
    
    NSLog("You entered the region")
    sendLocalNotificationWithMessage("You entered the region", playSound: false)
    }
    ////
    */
    
    /*
    ////
    func locationManager(manager: CLLocationManager!,
    didExitRegion region: CLRegion!) {
    manager.stopRangingBeaconsInRegion(region as CLBeaconRegion)
    manager.stopUpdatingLocation()
    
    NSLog("You exited the region")
    sendLocalNotificationWithMessage("You exited the region", playSound: true)
    }
    ////
    */
    
}

