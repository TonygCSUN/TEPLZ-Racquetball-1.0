//
//  DetailViewController.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 4/8/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // Container to store the view table selected object
    var currentObject : PFObject?
    
    
    @IBOutlet weak var userName: UITextField!
    
    
    @IBOutlet weak var objectId: UITextField!
    
    
    @IBOutlet weak var result: UITextField!
    
    
    @IBOutlet weak var score: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Unwrap the current object object
        if let object = currentObject? {
            userName.text = object["User"] as String
            objectId.text = object["objectId"] as String
            result.text = object["result"] as String
            score.text = object["score"] as String
        }
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
