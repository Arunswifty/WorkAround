//
//  FeedCell.swift
//  WorkAround
//
//  Created by Arun on 19/09/18.
//  Copyright © 2018 @ArunSwifty. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet var namelbl: UILabel!
    @IBOutlet var url: UILabel!
    
    var albumModels:AlbumModels!{
        didSet{
            namelbl.text = albumModels.title
            url.text = albumModels.url
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
