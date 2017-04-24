//
//  IntrusionTableViewCell.swift
//  MyHome
//
//  Created by Mickael Fonck on 24/04/2017.
//  Copyright © 2017 Mickael Fonck. All rights reserved.
//

import UIKit

class IntrusionTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var deviceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
