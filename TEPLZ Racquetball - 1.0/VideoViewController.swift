//
//  VideoViewController.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 2/25/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {


    @IBOutlet weak var webView: UIWebView!
    
    var basicShot : BasicShot!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // detailText.text = currentQuickPlay!.sectionDetailText
        
        /*
        let url = NSURL(string: [self.BasicShot!.sectionVideo])
        // let requestURL = NSURL(string: url)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        */
        // "https://youtu.be/qtQ063APXKw"
        
        let url = NSURL(string: "https://youtu.be/qtQ063APXKw")
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
