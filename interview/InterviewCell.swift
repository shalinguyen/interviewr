//
//  InterviewCell.swift
//  interview
//
//  Created by Bryan Pon on 11/14/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class InterviewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var candidateNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
