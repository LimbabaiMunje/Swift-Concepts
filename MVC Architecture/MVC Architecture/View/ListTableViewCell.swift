//
//  ListTableViewCell.swift
//  Web-Services(API)
//
//  Created by Mac on 16/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
