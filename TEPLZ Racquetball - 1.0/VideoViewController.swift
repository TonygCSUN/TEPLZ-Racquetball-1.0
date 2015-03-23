//
//  VideoViewController.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 2/25/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {

    @IBOutlet weak var detailText: UITextView!
    
    var currentQuickPlay : QuickPlay!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        detailText.text = currentQuickPlay!.sectionDetailText
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
