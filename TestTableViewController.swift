//
//  TestTableViewController.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 4/9/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//

import UIKit

//  Conform to the TableView Delegate and DataSource protocols
class TestTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    // tableview property
    @IBOutlet weak var tableView: UITableView!
    
    // add some data
    var items: [String] = ["We", "Heart", "Swift"]
    
    
    // set the number of rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    
    // create the cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        println("You selected cell #\(indexPath.row)!")
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
                // register the cell class
                self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
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
