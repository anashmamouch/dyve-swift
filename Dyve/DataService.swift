//
//  DataService.swift
//  Dyve
//
//  Created by Anas Hmamouch on 5/3/16.
//  Copyright © 2016 Benzino. All rights reserved.
//

import Foundation
import Firebase

/*
* Singelton class called only once to communicate with the 
* Firebases servers
*/

class DataService {
    //instance of DataService class only created once
    static let instance = DataService()
    
    //getting a reference to the firebase account
    private var _REF_BASE = Firebase(url: FIREBASE_URL)
    
    //getting a reference to the firebase posts node
    private var _REF_POSTS = Firebase(url: FIREBASE_URL_POSTS)
    
    //getting a reference to the firebase users node
    private var _REF_USERS = Firebase(url: FIREBASE_URL_USERS)
    
    //getter for the _REF_BASE variable (good practice)
    var REF_BASE: Firebase{
        return _REF_BASE
    }
    
    //getter for the _REF_POSTS variable
    var REF_POSTS: Firebase{
        return _REF_POSTS
    }
    
    //getter for the _REF_USERS variable
    var REF_USERS: Firebase{
        return _REF_USERS
    }
    
    //method for creating users in firebase
    func createFirebaseUsers(uid: String, user: Dictionary<String, String> ){
        REF_USERS.childByAppendingPath(uid).setValue(user)
    
    }
    
    
    
}