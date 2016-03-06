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
    private var _REF_BASE = Firebase(url: FIREBASE_URL )
    
    //getter for the _REF_BASE variable (good practice)
    var REF_BASE: Firebase{
        return _REF_BASE
    }
}