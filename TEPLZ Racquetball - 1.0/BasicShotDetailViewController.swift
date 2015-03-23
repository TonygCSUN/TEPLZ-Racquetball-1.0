//
//  BasicShotDetailViewController.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 3/1/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//

import UIKit

class BasicShotDetailViewController: UIViewController {

    var currentBasicShot: BasicShot?
    
    
    @IBOutlet weak var currentImage: UIImageView!
    
    @IBOutlet weak var currentText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var image = UIImage(named: currentBasicShot!.sectionDetailImage)
        currentImage.image = image
        
        currentText.text = currentBasicShot!.sectionDetailText
        // var text = UIText(named: currentQuickPlay!.sectionDetailText)
        // var currentText = UITextView(named: currentQuickPlay!.sectionDetailText)
        // currentText.text = text
        
        self.title = currentBasicShot!.name
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