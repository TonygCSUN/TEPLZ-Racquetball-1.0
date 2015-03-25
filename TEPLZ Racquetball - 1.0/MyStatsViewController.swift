//
//  MyStatsViewController.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 3/16/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//

import UIKit

class MyStatsViewController: UIViewController {

    
    var scores = [String]()
    var objectIDs = [String]()
    var results = [Bool]()
    var totalMatches = Int()
    
    
    
    
    
    @IBOutlet weak var winningPercent: UILabel!
    
    
    @IBOutlet weak var totalPoints: UILabel!
    
    
    @IBOutlet weak var totalGames: UILabel!
    
    
    @IBOutlet weak var latestStats: UIButton!
    
    @IBAction func retrieveStats(sender: AnyObject)
    {
        //
        
        ///////////////////////////////////////////////////////////
        //
        // performs query from Parse.com
        //
        ///////////////////////////////////////////////////////////
        
        // 
        
        // these are the arrays to store the data from Parse
        

        
        
        
        
        
        
        
        var getScoreDataQuery = PFQuery(className: "Match")
        // var getScoreDataQuery = PFQuery(className:"score")
        // getScoreDataQuery.whereKey("score", lessThan: 15)
        // getScoreDataQuery.whereKey("result", equalTo: false)
        getScoreDataQuery.selectKeys(["result", "score"])
        getScoreDataQuery.whereKey("results", containsAllObjectsInArray: [false])
        
        getScoreDataQuery.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                // objects in results will only contain the playerName and score fields
                println("Successfully retrieved \(objects.count) scores.")
                
                dump(self.scores)
                dump(self.objectIDs)
                dump(self.results)
                dump(objects)
                
                // println("\(objects)")
                

                
                for object in objects {
                    
                    self.scores.append(object ["score"] as String)
                    self.objectIDs.append(object ["objectId"] as String)
                    self.results.append(object ["result"] as Bool)
                    
                    self.totalGames?.text = object[self.scores.count] as? String
                    
                    
                    
                    
                }
                
                

            
            }
            else {
                println(error)
            }
            
            var matchResultsQuery = PFQuery(className:"Match")
            matchResultsQuery.whereKey("result", equalTo: true)
            matchResultsQuery.countObjectsInBackgroundWithBlock {
                (count: Int32, error: NSError!) -> Void in
                if error == nil {
                    println("you have Won \(count) games")
                    
                    self.results.append(objects.isEmpty)
                    
                    
                }
            }
            
            var matchScoreQuery = PFQuery(className:"Match")
            matchScoreQuery.whereKey("score", lessThan: 15)
            matchScoreQuery.countObjectsInBackgroundWithBlock {
                (count: Int32, error: NSError!) -> Void in
                if error == nil {
                    println("you have Won \(count) points")
                    
                    self.results.append(objects.isEmpty)
                    
                    
                }
            }
            
            
            
           
        
        
        //////////////////////////////////////////
        //////////////////////////////////////////
        /*
        
        getScoreDataQuery.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                // objects in results will only contain the playerName and score fields
                println("results")
                
                var matchScore = ""
                
                for object in objects {
                    
                    matchScore = object["score"] as String!
                    
                    /*
                    var query = PFQuery(className: "Match") // match is the name of the database class
                    query.whereKey("score", equalTo: PFUser.currentUser().username)
                    query.findObjectsInBackgroundWithBlock {
                    (objects: [AnyObject]!, error: NSError!) -> Void in
                    if error == nil {
                    // The find succeeded.
                    println("Successfully retrieved \(objects.count) scores.")
                    // Do something with the found objects
                    // if let objects = objects as? [PFObject] {
                    for object in objects {
                    // println(object.objectId)
                    
                    // this code updates the variables from the data source
                    scores.append(object["score"] as String)
                    usernames.append(object ["username"] as String)
                    
                    }
                    
                    }
                    else {
                    // Log details of the failure
                    println(error)
                    
                    }
                    }
                    
                    */
                    
                    scores.append(object["score"] as String)
                    
                    
                }
                
                // println("There are \(scores) objects")
                println(matchScore)
                println(scores)
            }
        }
        */
        ///////////////////////////////////////////
        ///////////////////////////////////////////
        
        
        
        
        
        
        /*
        var query = PFQuery(className:"Match")
        query.selectKeys(["User", "score"])
        // query.findObjectsInBackgroundWithBlock {
        query.getObjectWithId(objectId: "5cbCG2EiqK") {
            (Match: PFObject!, error: NSError!) -> Void in
            if error == nil && Match != nil{
                // objects in results will only contain the playerName and score fields
                // self.scores.append(self.score)
                
               
            
            
                println(Match)
                println(query.whereKey("score", lessThan: 21))
            }
        } */
        
        
        
        
    }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


       // totalGames.text = results.count as? String
        
        
        
        // Do any additional setup after loading the view.
        
        
        ///////////////////////////////////////////////////////////
        //
        // performs query from Parse.com
        //
        ///////////////////////////////////////////////////////////
        /*
        
        var getScoreDataQuery = PFQuery(className: "score")
        // var getScoreDataQuery = PFQuery(className:"score")
        // getScoreDataQuery.whereKeyscore(score, equalTo: )
        getScoreDataQuery.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                // objects in results will only contain the playerName and score fields
                println("results")
                
                var myCurrentUser = ""
                
                for object in objects {
                    
                    myCurrentUser = object["score"]as String
                    
                    var query = PFQuery(className: Match) // match is the name of the database class
                    query.whereKey("score", equalTo: PFUser.currentUser().username)
                    query.findObjectsInBackgroundWithBlock {
                        (objects: [AnyObject]!, error: NSError!) -> Void in
                        if error == nil {
                            // The find succeeded.
                            println("Successfully retrieved \(objects.count) scores.")
                            // Do something with the found objects
                            // if let objects = objects as? [PFObject] {
                            for object in objects {
                                // println(object.objectId)
                                
                                // this code updates the variables from the data source
                                self.scores.append(object["score"] as String)
                                self.usernames.append(object ["username"] as String)
                        
                            }
                            
                        }
                        else {
                            // Log details of the failure
                            println(error)
                            
                        }
                    }
                }
            }
        }
        
        
       ///////////////////////////////////////////////////////////
       //
       // performs check to ensure there are only numbers entered
       //
       ///////////////////////////////////////////////////////////
        
          */      
        
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







