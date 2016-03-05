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

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func fbButtonPressed(sender: UIButton) {
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self, handler: {(facebookResult, facebookError) -> Void in
            
            if facebookError != nil {
                print("Facebook login error: \(facebookError)")
            }else if facebookResult.isCancelled {
            
            }else {
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                print("Successfully logged in with facebook: \(accessToken) ")
                
                
            
            }
        
        })
    }

    
    
}

