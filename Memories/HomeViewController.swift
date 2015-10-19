//
//  HomeViewController.swift
//  Memories
//
//  Created by Michelle Johnson on 10/18/15.
//  Copyright © 2015 Andrew Wilkes. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController /*UITableViewDataSource, UITableViewDelegate */ {

    @IBOutlet weak var leftButton: UIButton!

    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var memNavBar: UINavigationBar!
    
    let sectionHeaders = [
        "",
        "Distance",
        "Sort By",
        "Category"
    ]
    
    var sectionRowCounts = [
        1,
        1,
        1,
        6 // show a few first, then potentially expand
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        leftButton.setImage(UIImage(named: "Menu"), forState: .Normal)
        leftButton.frame = CGRectMake(0,0,25,25)
        
        rightButton.setImage(UIImage(named: "Logout"), forState: .Normal)
        rightButton.frame = CGRectMake(0,0,25,25)
        
        memNavBar.tintColor = UIColor.whiteColor()
        
        //leftButton.addTarget(self, action: Selector("action"), forControlEvents: .TouchUpInside)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        return
    }
//    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        //return
//    }
//    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        //return
//    }
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        //return
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        //return nil
//    }
//
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        //return 0
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
