//
//  MenuViewController.swift
//  Memories
//
//  Created by Michelle Johnson on 10/18/15.
//  Copyright © 2015 Andrew Wilkes. All rights reserved.
//

import UIKit
import Parse

class MenuViewController: UIViewController {

    @IBOutlet weak var menuView: UIScrollView!
    var currentUser: PFUser!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var homeView : HomeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        var cameraView : CameraViewController = CameraViewController(nibName: "CameraViewController", bundle: nil)
        
        self.addChildViewController(homeView)
        self.menuView.addSubview(homeView.view)
        homeView.didMoveToParentViewController(self)
        
        self.addChildViewController(cameraView)
        self.menuView.addSubview(cameraView.view)
        cameraView.didMoveToParentViewController(self)
        
        var cameraViewFrame : CGRect = cameraView.view.frame
        cameraViewFrame.origin.x = self.view.frame.width
        cameraView.view.frame = cameraViewFrame
        
        self.menuView.contentSize = CGSizeMake(self.view.frame.width * 2, self.view.frame.height)
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
