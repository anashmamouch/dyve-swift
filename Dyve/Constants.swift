//
//  Constants.swift
//  Dyve
//
//  Created by Anas Hmamouch on 4/3/16.
//  Copyright © 2016 Benzino. All rights reserved.
//

import Foundation
import UIKit

//Global constants used by all the application

//Views
let SHADOW_COLOR: CGFloat = 157.0/255.0

/*
* Firebase
*/

//Firebase url
let FIREBASE_URL: String = "https://dyve.firebaseio.com/"
let FIREBASE_URL_POSTS: String = FIREBASE_URL + FIREBASE_PROPERTY_POSTS
let FIREBASE_URL_USERS: String = FIREBASE_URL + FIREBASE_PROPERTY_USERS

//Firebase properties
let FIREBASE_PROPERTY_POSTS: String = "posts"
let FIREBASE_PROPERTY_USERS: String = "users"


//Keys
let KEY_UID = "uid"

//Segways
let SEGUE_LOGGED_IN = "loggedIn"

//Status Codes
let STATUS_ACCOUNT_NOT_EXIST = -8
let STATUS_INVALID_PASSWORD = -6
