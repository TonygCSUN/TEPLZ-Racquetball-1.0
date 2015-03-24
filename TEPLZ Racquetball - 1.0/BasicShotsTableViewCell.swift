//
//  BasicShotsTableViewCell.swift
//  TEPLZ Racquetball - 1.0
//
//  Created by TonyGuerrero on 3/23/15.
//  Copyright (c) 2015 Apps for TEPLZ. All rights reserved.
//

import UIKit

class BasicShotsTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var basicShotImage: UIImageView!
    
    
    
    @IBOutlet weak var basicShotLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
