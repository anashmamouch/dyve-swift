//
//  Post.swift
//  Dyve
//
//  Created by Anas Hmamouch on 6/3/16.
//  Copyright © 2016 Benzino. All rights reserved.
//

import Foundation

class Post {
    private var _postKey: String!
    private var _postDescription: String!
    private var _postImageUrl: String?
    private var _postLikes: Int!
    private var _postUsername: String!
    
    var postKey: String{
        return _postKey
    }
    
    var postDescription: String{
        return _postDescription
    }
    
    var imageUrl: String?{
        return _postImageUrl
    }
    
    var likes: Int{
        return _postLikes
    }
    
    var username: String{
        return _postUsername
    }
    
    init(description: String, imageUrl: String?, username: String){
        self._postDescription = description
        self._postImageUrl = imageUrl
        self._postUsername = username
    }
    
    init(postKey: String, dictionary: Dictionary<String, AnyObject>){
        self._postKey = postKey
        
        if let likes = dictionary["likes"] as? Int{
            self._postLikes = likes
        }
        
        if let imageUrl = dictionary["imageUrl"] as? String{
            self._postImageUrl = imageUrl
        }
        
        if let description = dictionary["description"] as? String{
            self._postDescription = description
        }
    }
    
    
    
    

}
