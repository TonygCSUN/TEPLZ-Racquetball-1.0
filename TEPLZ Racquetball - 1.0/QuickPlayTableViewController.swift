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
        
        
        
        var newSection = QuickPlay(name: "Rules", sectionName: "Rules of the Game", sectionImage: "racquetball_player-2-fr1.png", sectionDetailText: "Play begins with the serve." + " The serving player must bounce the ball" + " on the floor once and hit it directly to the front wall," + " making the ball hit the floor." + "  Other fault serves include a ceiling serve in which the ball touches the ceiling after the front wall and serving before the receiving" + " player is ready. Also, the server must wait until the ball passes the short line before stepping out of the service box, otherwise it is a fault serve.or beyond the short line; otherwise the serve counts as a fault. The ball may touch one side wall, but not two, prior to hitting the floor; hitting both side walls after the front wall (but before the floor) is a 'three wall serve,' and a fault. Also, serving the ball into the front wall so that it rebounds to the back wall without hitting the floor first is a long serve, and a fault.  If the server hits the ball directly to any surface other than the front wall the server immediately loses serve regardless of whether it was first or second serve. \n" + "\n" + "After the ball bounces behind the short line, or passes the receiving line, the ball is in play and the opposing player(s) may play it. Usually, the server is allowed two opportunities (called first serve and second serve) to put the ball into play (two serve rule), although elite level competitions often allow the server only one opportunity (one serve rule).  After a successful serve, players alternate hitting the ball against the front wall. The player returning the hit may allow the ball to bounce once on the floor or hit the ball on the fly. However, once the player returning the shot has hit the ball, it must strike the front wall before striking the floor. Unlike during the serve, a ball in play may touch as many walls, including the ceiling, as necessary so long as it reaches the front wall without striking the floor.", sectionDetailImage: "Rules-and-Regs-349x227")
        sections.append(newSection)
        
        newSection = QuickPlay(name: "Court", sectionName: "The Court", sectionImage: "Racquetballcourtdimensions.jpg", sectionDetailText: "A racquetball court; fully enclosed indoor or outdoor with a front wall. The standard racquetball court is rectangular: 40 feet long, 20 feet wide, and 20 feet high with red lines defining the service and serve reception areas. \n" + "\n" + "The 'service box' is formed by the SHORT LINE (a solid red line running the court's width parallel to the front and back walls at a distance of 20 feet) and the SERVICE LINE (which runs parallel to the short line and is 15 feet from the front wall). Within the service box there are two sets of lines perpendicular to the short and service lines. \n" + "\n" + "One set of lines is 18 inches from, and parallel to, the side walls. Along with the short line, service line, and side wall these lines define the doubles box, where the non-serving doubles partner stands during the serve; 36 inches from the side wall is another set of lines which, along with the short line and the service line, define an area that the server must not enter if he wishes to hit a drive serve between himself and the nearest side wall. The RECEIVING LINE is a parallel dashed line 5 feet behind the short line. \n", sectionDetailImage: "racquetball_equipment")
        sections.append(newSection)
        
        newSection = QuickPlay(name: "Equipment", sectionName: "Required Equipment", sectionImage: "racquetball_player-1-fr1.png", sectionDetailText: " ** A racquetball racquet; no longer than 22 inches \n" + "\n" + " ** A racquetball; a dynamic (bouncy) rubber ball of 2.25 in. (57 mm) diameter \n" + "\n" + " ** Racquetball eye-guards (mandatory during competitions; some recreational players play without eye-guards but this is not recommended, as being hit in the eye by the ball can cause permanent vision damage). \n" + "\n" + " ** Sport Glove \n" + "\n" + "Racquetball differs from other racquet sports as most competitive players wear a glove on their racquet hand for the purpose of getting a better grip on the racquet (similar to golfers using a glove when driving), but gloves are optional equipment. Also, players usually wear a comfortable short sleeved shirt and shorts, as well as racquetball court shoes designed for enabling quick lateral as well as forward and backward movement.", sectionDetailImage: "racquetball_equipment")
        sections.append(newSection)
        
        newSection = QuickPlay(name: "Scoring", sectionName: "Scoring and Varitions", sectionImage: "guy_hitting_racquetball_fr4.png", sectionDetailText: "SCORING: \n" + "\n" + "Points can only be scored by the serving player or serving team in a doubles game, and points are the result of winning a rally that began with a successful serve. \n" + "During play, a player loses the rally if any one of the following occurs: \n" + "\n" + " ** The ball bounces on the floor more than once before being struck. \n" + "\n" + " ** The ball skips, or does not reach the front wall on the fly. \n" + "\n" + " ** The ball flies into the spectator's gallery or wall opening or strikes an out-of-bounds surface above the court's normal playing area. \n" + "\n" + " ** A slow ball strikes another player without the estimated speed and/or direction to strike the front wall. \n" + "\n" + " ** A ball struck by a player hits that player or that player's partner. \n" + "\n" + " ** A penalized hindrance. \n" + "\n" + " ** Switching racquet hands during a rally. \n" + "\n" + " ** Touching the ball with either the body or uniform. \n" + "\n" + "Under USA Racquetball rules, matches are best of three games with the first two games to 15 points and a third game to 11 points, if necessary. USA Racquetball rules do not require players to win by two, so a match score line could read 15–14, 14–15, 11–10. Racquetball Canada matches are also the best of three format, but require a winning margin of at least two points. International competitions run by the International Racquetball Federation are like the USA Racquetball scoring system: two games to 15 with a tie-breaker to 11, if necessary, and win by one. However, the men's and women's pro tours play matches that are the best-of-five games to 11 points, requiring a two-point margin for victory. \n" + "\n" + "VARIATIONS: \n" + "\n" + "Racquetball games can be played with two, three or four players, with doubles or singles matches being most common. Two player games are called singles or 'one-up' (one vs. one for the entire game), while four player games are doubles with two pairs playing against each other (two vs. two for the entire game). Tournament competitions have divisions for singles or doubles or both. \n" + "\n" + "Three-player games are most commonly called Cut-throat' and sometimes 'Iron-man' (two-on-one for the entire game) where each player takes turns serving to the other two, who play as a team against the serving player. Another three-player game is 'California', In-and-Out', or 'King of the Court' where play is 1 vs. 1 with the third player remaining in the back court out of play while the other two play a rally; the rally winner then serves to the player who was sitting out, and the rally loser stays out of play. Another three-player variation is 'Sevens' in which one player plays against two players as a team, with the game being played to seven points; if the two player team gets to seven first, the game is over, but if the solo player gets to seven first then the game continues to 14; if the solo player again reaches 14 first, then the game continues to 21, where the game ends regardless of whether the solo player or the two player team reach 21 first.", sectionDetailImage: "racquetball_rules-never_give_up")
        sections.append(newSection)
       
        // dump(sections)

        
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

    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 195 // 276
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // let cell = self.tableView.dequeueReusableCellWithIdentifier("quickPlayCell", forIndexPath: indexPath) as UITableViewCell
        var myCell:QuickPlayTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("quickPlayCell", forIndexPath: indexPath) as QuickPlayTableViewCell
        
        // Configure the cell...
        var newSection = sections[indexPath.row]
        myCell.textLabel2?.text = newSection.sectionName
        myCell.imageView2?.image = UIImage(named: newSection.sectionImage)
        
        
        // test 4

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
        var secondScene = segue.destinationViewController as QuickPlayDetailsViewController
        // Pass the selected object to the new view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow()
            {
                let selectedQuickPlay = sections[indexPath.row]
                secondScene.currentQuickPlay = selectedQuickPlay
            }
        
    }
    

}
