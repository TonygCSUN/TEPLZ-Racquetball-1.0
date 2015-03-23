//
//  QuickPlayTableViewController.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 2/25/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//

import UIKit


class QuickPlayTableViewController: UITableViewController {


    
    
    
    var sections = [QuickPlay]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var newSection = QuickPlay(name: "Rules", sectionName: "Rules of the Game", sectionImage: "racquetball_player-2-fr1.png", sectionDetailText: "Play begins with the serve." + " The serving player must bounce the ball" + " on the floor once and hit it directly to the front wall," + " making the ball hit the floor." + "  Other fault serves include a ceiling serve in which the ball touches the ceiling after the front wall and serving before the receiving" + " player is ready. Also, the server must wait until the ball passes the short line before stepping out of the service box, otherwise it is a fault serve.or beyond the short line; otherwise the serve counts as a fault. The ball may touch one side wall, but not two, prior to hitting the floor; hitting both side walls after the front wall (but before the floor) is a 'three wall serve,' and a fault. Also, serving the ball into the front wall so that it rebounds to the back wall without hitting the floor first is a long serve, and a fault.  If the server hits the ball directly to any surface other than the front wall the server immediately loses serve regardless of whether it was first or second serve.", sectionDetailImage: "Rules-and-Regs-349x227")
        sections.append(newSection)
        
        newSection = QuickPlay(name: "Equipment", sectionName: "Required Equipment", sectionImage: "racquetball_player-1-fr1.png", sectionDetailText: "A racquetball racquet; no longer than 22 inches \n" + "A racquetball; a dynamic (bouncy) rubber ball of 2.25 in. (57 mm) diameter \n" + "Racquetball eye-guards (mandatory during competitions; some recreational players play without eye-guards but this is not recommended, as being hit in the eye by the ball can cause permanent vision damage). \n" + "Sport Glove", sectionDetailImage: "racquetball_equipment")
        sections.append(newSection)
        
        newSection = QuickPlay(name: "Scoring", sectionName: "Scoring and Varitions", sectionImage: "guy_hitting_racquetball_fr4.png", sectionDetailText: "Points can only be scored by the serving player or serving team in a doubles game, and points are the result of winning a rally that began with a successful serve. \n" + "During play, a player loses the rally if any one of the following occurs: \n" + "The ball bounces on the floor more than once before being struck. \n" + "The ball skips, or does not reach the front wall on the fly. \n" + "The ball flies into the spectator's gallery or wall opening or strikes an out-of-bounds surface above the court's normal playing area. \n" + "A slow ball strikes another player without the estimated speed and/or direction to strike the front wall. \n" + "A ball struck by a player hits that player or that player's partner. \n" + "A penalized hindrance. \n" + "Switching racquet hands during a rally. \n" + "Touching the ball with either the body or uniform.", sectionDetailImage: "racquetball_rules-never_give_up")
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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return sections.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("quickPlayCell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        var newSection = sections[indexPath.row]
        cell.textLabel?.text = newSection.sectionName
        cell.imageView?.image = UIImage(named: newSection.sectionImage)
        
        
        // test 4

        return cell
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
        var secondScene = segue.destinationViewController as QuickPlayDetailsViewController
        // Pass the selected object to the new view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow()
            {
                let selectedQuickPlay = sections[indexPath.row]
                secondScene.currentQuickPlay = selectedQuickPlay
            }
        
    }
    

}
