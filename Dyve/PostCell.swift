//
//  PostCellTableViewCell.swift
//  Dyve
//
//  Created by Anas Hmamouch on 6/3/16.
//  Copyright © 2016 Benzino. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var likesLabel: UILabel!
    
    var post: Post!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //happening after constraints
    override func drawRect(rect: CGRect) {
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        
        img.clipsToBounds = true
    }

    func configureCell(post: Post){
        self.post = post
        
        self.descriptionText.text = post.postDescription
        self.likesLabel.text  = "\(post.likes)"
        
        
    }

}
