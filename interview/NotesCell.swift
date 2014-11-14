//
//  NotesCell.swift
//  interview
//
//  Created by Bryan Pon on 11/13/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class NotesCell: UITableViewCell {

    @IBOutlet weak var dateCreatedLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createdByLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
