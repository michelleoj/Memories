//
//  AppDelegate.swift
//  Memories
//
//  Created by Andrew Wilkes on 9/30/15.
//  Copyright © 2015 Andrew Wilkes. All rights reserved.
//

import Parse
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var storyboard = UIStoryboard(name: "Main", bundle: nil)


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        Parse.setApplicationId("SJpflGfFG8DeXNOzaKsZMpJV4e687glQoTkyLT7t", clientKey: "csIQzqtJ77QjH93M8TD6xAHuA71PiHZ9gNm5p0ZW")
        
        if ((PFUser.currentUser()) != nil) {
            let vc = storyboard.instantiateViewControllerWithIdentifier("MenuViewController")
            window?.rootViewController = vc
        }
        
        
        
//        let image = UIImage(named: "baleeted.jpg")
//        let testFileURL1 = NSURL(fileURLWithPath: NSTemporaryDirectory() + "/temp")
//        let data = UIImageJPEGRepresentation(image!, 1.0)
//        data!.writeToURL(testFileURL1, atomically: true)
//        
//        S3API.instance.put("baleeted.jpg", data: testFileURL1) { (url, error) -> () in
//            print(url)
//            print(error)
//        }
        
        return true
    }
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

