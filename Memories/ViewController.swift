//
//  ViewController.swift
//  Memories
//
//  Created by Andrew Wilkes on 9/30/15.
//  Copyright © 2015 Andrew Wilkes. All rights reserved.
//

import UIKit
import AFNetworking
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var dummyImageView: UIImageView!
    
    var currentUser: PFUser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        S3API.instance.get("Archer.png") { (url, error) -> () in
            if let url = url {
                self.dummyImageView.setImageWithURL(url)
            }
        }
        
        print("the current user: \(currentUser)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

