//
//  LoginViewController.swift
//  Memories
//
//  Created by michelle johnson on 10/6/15.
//  Copyright © 2015 Andrew Wilkes. All rights reserved.
//

import Parse
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    var currentUser: PFUser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginTouch(sender: AnyObject) {
        logIn()
    }
    
    @IBAction func signUpTouch(sender: AnyObject) {
        signUp()
    }
    
    
    func logIn() {
        let username = emailTextField.text
        let password = passwordTextField.text
        PFUser.logInWithUsernameInBackground(username!, password: password!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                // Do stuff after successful login.
                print("yay you're logged in")
                self.currentUser = PFUser.currentUser()
                
                self.performSegueWithIdentifier("successfulLoginSegue", sender: self)
            } else {
                // The login failed. Check error to see why.
                print("couldn't log in")
            }
        }
        
    }
    
    func signUp() {
        if emailTextField.text != nil && passwordTextField.text != nil {
            let user = PFUser()
            user.username = emailTextField.text
            user.email = emailTextField.text
            user.password = passwordTextField.text
            
            user.signUpInBackgroundWithBlock {
                (succeeded: Bool, error: NSError?) -> Void in
                if let error = error {
                    let errorString = error.userInfo["error"] as? NSString
                    // Show the errorString somewhere and let the user try again.
                    print(errorString)
                } else {
                    // Hooray! Let them use the app now.
                    print("You've logged in!")
                    self.performSegueWithIdentifier("successfulLoginSegue", sender: self)
                }
            }
        }
    }
    
    
    
    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        let destinationViewController = segue.destinationViewController as! MenuViewController
        destinationViewController.currentUser = self.currentUser
            
    }

    
    
}
