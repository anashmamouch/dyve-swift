//
//  ViewController.swift
//  Dyve
//
//  Created by Anas Hmamouch on 4/3/16.
//  Copyright © 2016 Benzino. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //segways only work after the view appear on the screen 
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //get the userdefaults data (authData)
        if NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) != nil{
            self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
        }
        
    }
    
    

    @IBAction func fbButtonPressed(sender: UIButton) {
        let facebookLogin = FBSDKLoginManager()
        
        
        //Login with facebook
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self, handler: {(facebookResult, facebookError) -> Void in
            
            if facebookError != nil {
                print("Facebook login error: \(facebookError)")
            }else if facebookResult.isCancelled {
            
            }else {
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                print("Successfully logged in with facebook: \(accessToken) ")
                
                //if successfully login talk to Firebase
                //grab the variable to connect with the firebase url 
                DataService.instance.REF_BASE.authWithOAuthProvider("facebook", token: accessToken, withCompletionBlock: { error, authData in
                    
                    
                    if error != nil {
                        print("Login failed: \(error)")
                    }else {
                        print("Logged In: \(authData)")
                        
                        //create a firebase user
                        let user = ["provider": authData.provider!, "username": "anas"]
                        DataService.instance.createFirebaseUsers(authData.uid, user: user)
                        
                        //store on the device the token of the firebase user
                        NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: KEY_UID)
                        
                        //login to a new ui view controller
                        self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                    }
                    
                    
                })
            }
        
        })
    }
    
    
    @IBAction func loginButtonPressed(sender: UIButton) {
        
        if let email = emailField.text where email != "", let password = passwordField.text where password != ""{
            
            //login code
            //auth with firebase
            DataService.instance.REF_BASE.authUser(email, password: password, withCompletionBlock: { error, authData in
                
                if error != nil {
                
                    print(error.code)
                    
                    //if user does not exist create a new user
                    if error.code == STATUS_ACCOUNT_NOT_EXIST {
                       DataService.instance.REF_BASE.createUser(email, password: password, withValueCompletionBlock: { error, result in
                        
                        //handles error for creating new users
                        if error != nil {
                            self.showAlert("Could not create account", message: "Problem creating account...")
                        }else {
                            //store it in userDefaults
                            NSUserDefaults.standardUserDefaults().setValue(result[KEY_UID], forKey: KEY_UID)
                            
                            //login 
                            DataService.instance.REF_BASE.authUser(email, password: password, withCompletionBlock: {error, authData in
                                
                                //create a firebase user
                                let user = ["provider": authData.provider!, "username": "anas"]
                                DataService.instance.createFirebaseUsers(authData.uid, user: user)
                            })
                            
                            self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                        }
                       })
                    }else if error.code == STATUS_INVALID_PASSWORD{
                        self.showAlert("Invalid password", message: "Password does not match with email please enter a different password.")
                    }else {
                    
                        self.showAlert("Could not login", message: "Please check your email and password.")
                    }
                    
                }else{
                    //if there was no error logging in
                    self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                }
            })
            
            
        }else {
            showAlert("Email and password required", message: "Please enter a valid email and password.")
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert )
        
        let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
}

