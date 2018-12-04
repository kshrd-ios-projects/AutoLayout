//
//  ImagePostTableViewCell.swift
//  HomeworkAutoLayout
//
//  Created by Sreng Khorn on 3/12/18.
//  Copyright © 2018 Sreng Khorn. All rights reserved.
//

import UIKit

class ImagePostTableViewCell: UITableViewCell {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var commentTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userProfileImageView.layer.cornerRadius = userProfileImageView.frame.size.width / 2
        userProfileImageView.clipsToBounds = true
        
        commentTextField.layer.cornerRadius = 25.0
        commentTextField.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
