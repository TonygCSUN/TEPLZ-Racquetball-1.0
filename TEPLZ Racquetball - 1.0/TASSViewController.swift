//
//  TASSViewController.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 3/1/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//

import UIKit

class TASSViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "https://sites.google.com/site/lessonsinracquetball/home/cscl-activities/cscs-investigations-you-have-created/cscl-lesson-4")
        // let requestURL = NSURL(string: url)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        
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
