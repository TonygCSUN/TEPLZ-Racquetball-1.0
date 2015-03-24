//
//  BasicShotsViewController.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 3/1/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//  

import UIKit

class BasicShotsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    var sections = [BasicShot]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var newSection = BasicShot(name: "Pass", sectionName: "Pass Shot", sectionImage: "Eketelon_O3_SIlver", sectionDetailText: "The smartest, most productive shot used by all player skill levels. A pass shot is hit directly to the front wall and rebounds to the court area furthest from the opponent.  There are two types of pass shots, 'Down the Line' (pictured at left) and 'Cross Court'.", sectionDetailImage: "basicshot_passing.jpg")
        sections.append(newSection)
        
        newSection = BasicShot(name: "Pinch", sectionName: "Pinch Shot", sectionImage: "Eketelon_O3_SIlver", sectionDetailText: "The pinch shot is an effective way to keep a low hit or soft hit ball in the front area of the court.  A pinch shot hits the side wall first (near the front wall), hits the front wall and rebounds in the front half of the court to the opposite side wall.  There are two types of pinch shots, hit to the left side or right side walls. Pinch shots should be hit low enough on the front wall so the ball rebound from the front wall bounces twice on the floor before touching the opposite side wall.", sectionDetailImage: "basicshot_pinch.jpg")
        sections.append(newSection)
        
        newSection = BasicShot(name: "Kill", sectionName: "Kill Shot", sectionImage: "Eketelon_O3_SIlver", sectionDetailText: "Impossible for opponent to return!  Any shot that rebounds from the front wall “low” and bounces twice on the floor near the front wall.  The second bounce occurs so quickly that it is impossible for the opponent to return.  The easiest way to hit a kill shot is to hit the ball when the ball is just a few inches above the floor. The difficult part is hitting the ball very hard, parallel with the floor, low to the front wall.  The slightest miscalculation results wit the ball skipping into the floor before hitting the front wall (out) or hitting the ball too high on the front wall and being easily playable by the opponent.", sectionDetailImage: "basicshot_kill.jpg")
        sections.append(newSection)
        
        newSection = BasicShot(name: "Ceiling", sectionName: "Ceiling Shot", sectionImage: "Eketelon_O3_SIlver", sectionDetailText: "A ceiling shot hits the ceiling first, near the front wall, hits high on the front wall, hits the floor in the front of the court, bounces very high and dies (second bounce) on or just after the back wall.  An effective alternative whenever the hitter is in a defensive position and can't hit a pass, pinch or kill shot.  Also used as a offensive shot whenever the opponent is positioned too close to the front wall. Ceiling shots will force your opponent to the rear of the court and allow you time to reset your position on the court.  A ceiling shot will also allow your opponent time to make a return unless they were positioned too close to the front wall.  The ceiling shot must be hit hard enough to get to the back wall on the second bounce. Hitting too soft will result in a easy set-up for the opponent.", sectionDetailImage: "basicshot_ceiling.jpg")
        sections.append(newSection)
        
        newSection = BasicShot(name: "OTBW", sectionName: "Off the Back Wall Shot", sectionImage: "Eketelon_O3_SIlver", sectionDetailText: "When the opponents shot is hit too hard or high and bounces off the back wall.  The hitter waits for the ball from the back wall and hits any shot to the front wall.  The easiest shot to master with some experience and practice.  Allows the hitter time to position and hit any type of shot, including kill shots.", sectionDetailImage: "basicshot_off_theback_wall.jpg")
        sections.append(newSection)
        
        newSection = BasicShot(name: "ITBW", sectionName: "Into the Back Wall Shot", sectionImage: "Eketelon_O3_SIlver", sectionDetailText: "Hitting the ball into the back wall.  Used only as a last resort when no other shot can be hit directly to the front wall.  Limited control, possible chance of rebounding back into hitter (or opponent).  Used when no backhand or forehand is possible or after a ball has passed the hitter.  All shots into the back wall should be hit high enough to make it to the front wall but soft enough so the ball doesn't rebound off of the back wall during the opponents return.", sectionDetailImage: "basicshot_into_the_back_wall.jpg")
        sections.append(newSection)
        
        newSection = BasicShot(name: "ATW", sectionName: "Around the World Shot", sectionImage: "Eketelon_O3_SIlver", sectionDetailText: "Purely a defensive shot when out of position.  The ball is hit hard enough at the side wall to rebound to the front wall and hit the opposite sidewall as high as possible.  The ball will then bounce on the floor just behind center court and head to the opposite back corner and die (second bounce) after hitting the back wall.  Like the ceiling shot, is used whenever no other pass, pinch or kill shot is available.  Difficult to master without practice because of the angles and number of walls hit.", sectionDetailImage: "basicshot_around_the_world.jpg")
        sections.append(newSection)
        
        newSection = BasicShot(name: "Zball", sectionName: "Z-Ball Shot", sectionImage: "Eketelon_O3_SIlver", sectionDetailText: "Hits the front wall, side wall and opposite side wall (without touching the ceiling, floor or back wall) and rebounds parallel to the back wall.  The spin generated from the 3-walls reverses the direction of the ball.  Hit correctly, the ball ends up rolling along the back wall and is impossible to return (reason why its illegal for server to hit).  Hit incorrectly, the ball will be come a easy setup for the opponent. The correct z-ball shot is hit as high as possible and requires the hitter to be near the opposite side wall.  Difficult to master without practice and experience. Should not be used if a pass, pinch or kill shot is possible and only used once mastered.", sectionDetailImage: "basicshot_z_ball.jpg")
        sections.append(newSection)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return sections.count
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 125
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var myCell:BasicShotsTableViewCell = tableView.dequeueReusableCellWithIdentifier("basicShotCell", forIndexPath: indexPath) as BasicShotsTableViewCell
        
        var newSection = sections[indexPath.row]
        
        // Configure the cell...
        myCell.basicShotLabel?.text = newSection.sectionName
        myCell.basicShotImage?.image = UIImage(named: newSection.sectionImage)
        

        return myCell
}


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        var secondScene = segue.destinationViewController as BasicShotDetailViewController
        // Pass the selected object to the new view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow()
        {
            let selectedBasicShot = sections[indexPath.row]
            secondScene.currentBasicShot = selectedBasicShot
        }
    

}


}

