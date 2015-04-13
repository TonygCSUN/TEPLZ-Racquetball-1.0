//
//  PostFamiliarViewController.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 4/12/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//

import UIKit

class PostFamiliarViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = NSURL(string: "https://docs.google.com/forms/viewform?hl=en&id=1o4PBlEFX2_BX1Bmg1mmb1LplzSMBCWStZ3T3iV4T0NY")
        // let requestURL = NSURL(string: url)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        
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
