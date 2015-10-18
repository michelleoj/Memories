//
//  HomeViewController.swift
//  Memories
//
//  Created by Michelle Johnson on 10/18/15.
//  Copyright © 2015 Andrew Wilkes. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {


    @IBOutlet weak var leftButton: UIButton!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var memNavBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        leftButton.setImage(UIImage(named: "Menu"), forState: .Normal)
        leftButton.frame = CGRectMake(0,0,20,20)
        
        //leftButton.addTarget(self, action: Selector("action"), forControlEvents: .TouchUpInside)
        
        
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
